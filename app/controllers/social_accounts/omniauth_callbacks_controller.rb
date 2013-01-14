# -*- encoding : utf-8 -*-
class SocialAccounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    social_account = SocialAccount.find_for_facebook_oauth request.env["omniauth.auth"], cookies
    if social_account.persisted?
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
    sign_in_and_redirect social_account, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def vkontakte
    social_account = SocialAccount.find_for_vkontakte_oauth request.env["omniauth.auth"], cookies
    if social_account.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      sign_in_and_redirect social_account, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def google
    social_account = SocialAccount.find_for_google_oauth request.env["omniauth.auth"], cookies
    if social_account.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect social_account, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end


  def twitter
    social_account = SocialAccount.find_for_twitter_oauth request.env["omniauth.auth"], cookies
    if social_account.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect social_account, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

end
