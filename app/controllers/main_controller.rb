# -*- encoding : utf-8 -*-
class MainController < ApplicationController

  def home
    if cookies[:back].present?
      redirect_to cookies[:back]
      cookies[:back] = nil
    end
    @head_style = "font-size: 30px;left: 20px;top: 0px;width: 50%;" if social_account_signed_in?
    @main_style = "position: absolute; bottom: 50%;top:auto" unless social_account_signed_in?
    @blank_style = "height:36%" unless social_account_signed_in?
  end

  def about

  end

  def posts

  end

end
