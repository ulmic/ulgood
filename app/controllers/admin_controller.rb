# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  def users
  end

  def issues
    @head_style = "font-size: 30px;left: 20px;top: 0px;width: 50%;" if social_account_signed_in?
  end
end
