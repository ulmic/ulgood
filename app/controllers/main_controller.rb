# -*- encoding : utf-8 -*-
class MainController < ApplicationController

  def home
    @head_style = "font-size: 30px;left: 20px;top: 0px;width: 50%;" if social_account_signed_in?
    @main_style = "top:30%;" unless social_account_signed_in?
  end

  def about

  end

  def posts

  end

end
