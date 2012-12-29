# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :name, :admin
  has_many :social_users

  def admin?
    !self.admin.nil?
  end

end
