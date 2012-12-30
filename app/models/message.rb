# -*- encoding : utf-8 -*-
class Message < ActiveRecord::Base
  attr_accessible :message
  belongs_to :social_user
end
