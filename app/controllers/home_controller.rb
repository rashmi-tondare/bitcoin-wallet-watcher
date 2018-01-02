class HomeController < ApplicationController
  def index
    redirect_to wallet_info_path
  end
end
