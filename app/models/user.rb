# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

  attr_accessible :admin, :avatar, :name

  has_many :social_accounts, :dependent => :destroy

  def admin?
    self.admin == Digest::MD5.hexdigest(Ulgood::Application.config.ulgood_admin_key + self.id.to_s)
  end

end
