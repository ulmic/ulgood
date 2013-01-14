# -*- encoding : utf-8 -*-
class MessagesController < ApplicationController

   # POST /messages
  # POST /messages.json
  def create
    @message = current_social_account.messages.build :message => params[:message][:message], :checked => nil

    respond_to do |format|
      if @message.save
        format.html { redirect_to :back }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def index
    redirect_to :back
  end

  def check
    message = Message.find(params[:id])
    message.checked = current_social_account.user.id
    message.save!
    redirect_to :back
  end

end
