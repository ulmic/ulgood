# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  def home
    if !cookies[:provider].blank?
      redirect_to "/login?provider=#{cookies[:provider]}"
    end
  end

  def about
  end
end
