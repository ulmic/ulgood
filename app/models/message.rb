# -*- encoding : utf-8 -*-
class Message < ActiveRecord::Base

  attr_accessible :message, :social_account_id, :checked

  belongs_to :social_account

  def checked?
    !self.checked.blank?
  end

end
