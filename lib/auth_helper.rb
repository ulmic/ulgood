module AuthHelper

  def account_sign_in(account)
    session[:account_id] = account.id
    session[:admin_id] = account.id if account.user.admin?
  end

  def account_sign_out
    session[:account_id] = nil
    session[:admin_id] = nil
  end

  def account_signed_in?
    session[:account_id] && Account.find_by_id(session[:account_id])
  end

  def current_account
    if session[:account_id]
      Account.find(session[:account_id])
    end
  end

  def current_user
    current_account.user if current_account
  end

  def admin_signed_in?
    session[:admin_id] && User.find_by_id(session[:admin_id]).admin?
  end

end
