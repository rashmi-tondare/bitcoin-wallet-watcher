# frozen_string_literal: true

class WalletInfoController < ApplicationController

  def get
    service = WalletInfoService.new(wallet_address)
    if service.info
      @result = service.result
    else
      @error = service.error
    end
  end

  private

  def wallet_address
    params[:address]
  end
end
