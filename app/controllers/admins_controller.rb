class AdminsController < ApplicationController

  before_filter do
    redirect_to :back unless admin_signed_in?
  end

  def users
  end

  def posts
  end
end
