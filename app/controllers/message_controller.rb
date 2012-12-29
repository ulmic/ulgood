# -*- encoding : utf-8 -*-
class MessageController < ApplicationController

  def create
    if !social_user_signed_in?
      redirect_to :controller => "main", :action => "home"
    end

    if request.post?

      message = Message.new
      message.social_user_id = current_social_user.id
      message.message = params[:message].values[0].to_message
      message.checked=0
      message.created_at = Time.now
      message.save!

      redirect_to :action => "thanks"
    end
  end

  def delete
    message = Message.find(params[:id])
    if !message.nil?
      message.delete if message.social_user == current_social_user
    end
    redirect_to :back
  end

end


class String
  def to_message
    self[0] = self[0].downcase
    self
  end
end
