class Account < ActiveRecord::Base
  attr_accessible :provider, :uid, :url

  belongs_to :user
  has_many :goods, :dependent => :destroy

  validates :provider, presence: true, inclusion: { in: %w(vkontakte facebook twitter google) }
  validates :uid, presence: true, uniqueness: true

  def self.find_or_create (auth)
    find_by_provider_and_uid(auth['provider'], auth['uid']) || create! do |account|
      account.provider = auth['provider']
      account.uid = auth['uid']
      if account.provider == 'google' then
        account.url = "mailto:#{auth['info']['email']}"
      else
        account.url = auth['info']['urls'][account.provider.capitalize]
      end
    end
  end
end
