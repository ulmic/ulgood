module AuthHelper
  # account auth
  def account_sign_in(account)
    session[:account_id] = account.id
  end

  def account_sign_out
    session[:account_id] = nil
  end

  def account_signed_in?
    session[:account_id] && Account.find_by_id(session[:account_id])
  end

  def current_account
    if session[:account_id]
      @current_account ||= Account.find(session[:account_id])
    end
  end

  #User

  def current_user
    current_account.user if current_account
  end

  #TODO: realize admin

  #Admin auth
  #def admin_sign_in(admin)
  #  session[:admin_id] = admin.id
  #end
  #
  #def admin_signed_in?
  #  session[:admin_id] && User.find_by_id(session[:admin_id]).admin?
  #end
  #
  #def admin_sign_out
  #  session[:admin_id] = nil
  #end

  #Omniauth helper

  def omniauth_get_info(auth)
    case auth["provider"]
      when 'vkontakte'
        { name: auth["info"]["name"], avatar: auth["extra"]["raw_info"]["photo_big"] }
      when 'facebook'
        { name: auth["extra"]["raw_info"]["name"], avatar: auth["info"]["image"] }
      when 'twitter'
        { name: auth["info"]["name"], avatar: auth["info"]["image"] }
      when 'google'
        { name: auth["info"]["name"], avatar: auth["info"]["image"] }
        end
  end

end
