class User < ActiveRecord::Base
  attr_accessible :avatar, :name, :admin

  has_many :accounts, :dependent => :destroy

  validates :name, presence: true
  validates :avatar, format: { with: /^https?:\/\/[\w\/\.]+\.(jpe?g|gif|png)/ }, allow_nil: true
end