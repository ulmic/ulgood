class User < ActiveRecord::Base
  attr_accessible :avatar, :name, :admin

  has_many :accounts, :dependent => :destroy

  validates :name, presence: true
  validates :avatar, format: { with: /^https?:\/\/[\w\/\.]+(\.?(|jpe?g|gif|png)|picture[\?]?[\w\=\&]*)/ }, allow_nil: true

  def has_account_in(provider)
    self.accounts.find_by_provider(provider).present?
  end
end