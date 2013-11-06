class AccountsController < ApplicationController

  def login
    auth = request.env['omniauth.auth']
    account = Account.find_or_create(auth)
    if account.user.nil?
      if current_user
        current_user.accounts << account
      else
        new_user = User.new name: auth['info']['name'], avatar: auth['info']['image']
        unless new_user.save
          redirect_to root_url, notice: t('errors.user.create')
          return
        end
        new_user.accounts << account
      end
    end
    account_sign_in account
    redirect_to root_url
  end

  def logout
    account_sign_out
    redirect_to root_url
  end
end
