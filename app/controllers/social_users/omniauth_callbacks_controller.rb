# -*- encoding : utf-8 -*-
class SocialUsers::OmniauthCallbacksController < ApplicationController

  def login
    redirect_to (url_for :controller => "social_users/omniauth_callbacks", :action => params[:provider].to_s)
  end

  def facebook
      q = SocialUser.find_for_facebook_oauth request.env["omniauth.auth"], cookies
      user = q[:user]
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      cookies.delete(:user)
      cookies.delete(:provider)
      cookies[:redirect] = "/me" if q[:new]=="true"
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def vkontakte
    q = SocialUser.find_for_vkontakte_oauth request.env["omniauth.auth"], cookies
    user = q[:user]
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      cookies.delete(:user)
      cookies.delete(:provider)
      cookies[:redirect] = "/me" if q[:new]=="true"
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def twitter
    q = SocialUser.find_for_twitter_oauth request.env["omniauth.auth"], cookies
    user = q[:user]
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      cookies.delete(:user)
      cookies.delete(:provider)
      cookies[:redirect] = "/me" if q[:new]=="true"
      sign_in_and_redirect user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def google
    q = SocialUser.find_for_google_oauth request.env["omniauth.auth"], cookies
    user = q[:user]
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      cookies.delete(:user)
      cookies.delete(:provider)
      sign_in_and_redirect user, :event => :authentication
      cookies[:redirect] = "/me" if q[:new]=="true"
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end


end
