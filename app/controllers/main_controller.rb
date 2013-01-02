# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  def home
    if !cookies[:redirect].blank?
      path = cookies[:redirect]
      cookies.delete :redirect
      redirect_to path
    end
    if !cookies[:provider].blank?
      redirect_to "/login?provider=#{cookies[:provider]}"
    end
  end

  def about
  end
end
