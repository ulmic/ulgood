class AccountsController < ApplicationController

  def login
    auth = request.env["omniauth.auth"]
    account = Account.find_or_create(auth)
    if current_user
      current_user.accounts << account
    else
      new_user = User.new name: auth["info"]["name"], avatar: auth["info"]["image"]
      unless new_user.save
        redirect_to root_url, :notice => "User creating error!"
        return
      end
      new_user.accounts << account
    end
    account_sign_in account
    redirect_to root_url, :notice => "Signed in!"
  end

  def logout
    account_sign_out
    redirect_to root_url, :notice => "Signed out!"
  end
end
