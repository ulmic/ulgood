class Account < ActiveRecord::Base
  attr_accessible :provider, :uid

  belongs_to :user
  has_many :goods, :dependent => :destroy

  validates :provider, presence: true, inclusion: { in: %w(vkontakte facebook twitter google) }
  validates :uid, presence: true, uniqueness: true

  def self.find_or_create (auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create! do |account|
      account.provider = auth["provider"]
      account.uid = auth["uid"]
    end
  end

  def self.get_info(auth)
    case auth["provider"]
      when 'vkontakte'
        { name: auth["info"]["name"], avatar: auth["extra"]["raw_info"]["photo_big"] }
      when 'facebook'
        { name: auth["extra"]["raw_info"]["name"], avatar: auth["info"]["image"] }
      when 'twitter'
        { name: auth["info"]["name"], avatar: auth["info"]["image"] }
      when 'google'
        { name: auth["info"]["name"], avatar: auth["info"]["image"] }
    end
  end

end
