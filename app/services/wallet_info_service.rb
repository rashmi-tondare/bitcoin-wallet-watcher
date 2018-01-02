# frozen_string_literal: true

class WalletInfoService < ApplicationService
  def initialize(wallet_address)
    @wallet_address = wallet_address
  end

  def info
    fetch_info &&
      set_result
  end

  private

  attr_reader :wallet_address

  def fetch_info
    response = server.request(method: :get, path: "rawaddr/#{wallet_address}")
    if response.status == 200
      body = JSON.parse(response.body)
      @resp_body = body.with_indifferent_access if body.is_a?(Hash)
      true
    else
      @error = response.body
      false
    end
  end

  def set_result
    @result = {
      balance:      get_bitcoin(@resp_body[:final_balance]),
      transactions: transactions
    }
  end

  def get_bitcoin(satoshis)
    btc = satoshis.to_f / 100_000_000
    btc.zero? ? 0 : "%.8f" % btc
  end

  # rubocop:disable Metrics/AbcSize
  def transactions
    return [] if @resp_body[:txs]&.empty?
    transactions = []
    @resp_body[:txs].each do |txn|
      transaction = {}
      inputs = txn[:inputs].map {|input| input[:prev_out][:addr] }
      outputs = txn[:out].map {|out| out[:addr] }
      is_credit = wallet_address.in?(outputs)

      transaction[:senders] = is_credit ? inputs : [wallet_address]
      transaction[:receivers] = is_credit ? [wallet_address] : outputs
      values = is_credit ? txn[:inputs].map {|input| input[:prev_out][:value] } : txn[:out].map {|out| out[:value] }
      transaction[:values] = values.map {|value| get_bitcoin(value) }

      entry = txn[:out].find {|out| out[:addr] == wallet_address } if is_credit
      entry = txn[:inputs].find {|input| input[:prev_out][:addr] == wallet_address } unless is_credit

      value = is_credit ? entry[:value] : entry[:prev_out][:value]
      transaction[:amount] = "#{is_credit ? '+' : '-'}#{get_bitcoin(value)}"

      transaction[:date] = Time.zone.at(txn[:time]).strftime("%d %b %Y %H:%M:%S")

      transactions << transaction
    end
    transactions
  end
  # rubocop:enable Metrics/AbcSize

  def server
    @_server ||= Excon.new("https://blockchain.info/")
  end
end
