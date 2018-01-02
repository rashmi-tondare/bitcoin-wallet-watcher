# frozen_string_literal: true

Rails.application.routes.draw do
  root "wallet_info#base"

  get "/wallet-info", to: "wallet_info#get", as: :wallet_info
end
