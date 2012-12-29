# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  def new_posts
    unless current_social_user.user.admin?
      redirect_to :root
    end
end

  def allow
    if current_social_user.user.admin?
      m=Message.find(params[:id])
      "s"
      unless m.nil?
        m.checked=1
        m.save!
      end
    end
    redirect_to :back
  end

end
