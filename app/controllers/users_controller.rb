# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def delete
    if current_social_user.user.admin? || params[:id] == current_social_user.user.id.to_s
        deleting_user = User.find(params[:id])
        deleting_user.delete if !deleting_user.nil?
    end
    redirect_to :root
  end

  def add
    cookies[:provider] = params[:provider]
    cookies[:user] = current_social_user.user.id
    redirect_to destroy_social_user_session_path
  end

end
