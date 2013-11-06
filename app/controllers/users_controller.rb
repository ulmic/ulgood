class UsersController < ApplicationController

  before_filter do
    redirect_to :root unless account_signed_in?
  end

  def show
    @user = User.find(params[:id])
  end
end
