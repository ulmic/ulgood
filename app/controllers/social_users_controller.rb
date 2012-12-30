# -*- encoding : utf-8 -*-
class SocialUsersController < ApplicationController
  # GET /social_users/new
  # GET /social_users/new.json
  def new
    @social_user = SocialUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @social_user }
    end
  end

  # POST /social_users
  # POST /social_users.json
  def create
    @social_user = SocialUser.new(params[:social_user])

    respond_to do |format|
      if @social_user.save
        format.html { redirect_to @social_user, notice: 'Social user was successfully created.' }
        format.json { render json: @social_user, status: :created, location: @social_user }
      else
        format.html { render action: "new" }
        format.json { render json: @social_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_users/1
  # DELETE /social_users/1.json
  def destroy
    @social_user = SocialUser.find(params[:id])
    @social_user.destroy

    respond_to do |format|
      format.html { redirect_to social_users_url }
      format.json { head :no_content }
    end
  end

  def login
    redirect_to social_user_omniauth_authorize_path(params[:provider].to_sym)
  end

end
