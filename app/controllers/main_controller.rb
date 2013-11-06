class MainController < ApplicationController

  layout 'not_logged'

  def home
    redirect_to goods_path if account_signed_in?
  end
end
