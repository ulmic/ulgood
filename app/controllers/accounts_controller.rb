class AccountsController < ApplicationController

  def login
    auth = request.env["omniauth.auth"]
    account = Account.find_or_create(auth)

    if current_user
      current_user.accounts << account
    else
      info = Account.get_info(auth)
      new_user = User.create name: info[:name], avatar: info[:avatar]
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
