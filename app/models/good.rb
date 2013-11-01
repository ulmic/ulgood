class Good < ActiveRecord::Base
  attr_accessible :checked, :repost_count, :text

  belongs_to :account
  validates :text, presence: true, length: {in: 10..100}

  def self.today
    Good.where(created_at: Time.now.midnight..Time.now)
  end

  def user
    self.account.user
  end

end
