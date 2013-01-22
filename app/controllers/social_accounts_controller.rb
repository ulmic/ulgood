# -*- encoding : utf-8 -*-
class SocialAccountsController < ApplicationController

  # POST /social_accounts
  # POST /social_accounts.json
  def create
    @social_account = SocialAccount.new(params[:social_account])

    respond_to do |format|
      if @social_account.save
        format.html { redirect_to @social_account, notice: 'Social account was successfully created.' }
        format.json { render json: @social_account, status: :created, location: @social_account }
      else
        format.html { render action: "new" }
        format.json { render json: @social_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_accounts/1
  # DELETE /social_accounts/1.json
  def destroy
    @social_account = SocialAccount.find(params[:id])
    @social_account.destroy

    respond_to do |format|
      format.html { redirect_to social_accounts_url }
      format.json { head :no_content }
    end
  end

  def login
    cookies[:back] = params[:back]
    cookies[:user] = current_social_account.user.id if social_account_signed_in?
    redirect_to social_account_omniauth_authorize_path(params[:provider].to_sym)
  end

end
