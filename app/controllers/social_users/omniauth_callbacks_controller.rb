# -*- encoding : utf-8 -*-
class SocialUsers::OmniauthCallbacksController < ApplicationController

  def login
    redirect_to (url_for :controller => "social_users/omniauth_callbacks", :action => params[:provider].to_s)
  end

  def facebook
      user = SocialUser.find_for_facebook_oauth request.env["omniauth.auth"], cookies
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      cookies.delete(:user)
      cookies.delete(:provider)
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def vkontakte
    user = SocialUser.find_for_vkontakte_oauth request.env["omniauth.auth"], cookies
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      cookies.delete(:user)
      cookies.delete(:provider)
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def twitter
    user = SocialUser.find_for_twitter_oauth request.env["omniauth.auth"], cookies
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      cookies.delete(:user)
      cookies.delete(:provider)
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def google
    user = SocialUser.find_for_google_oauth request.env["omniauth.auth"], cookies
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      cookies.delete(:user)
      cookies.delete(:provider)
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end


end
