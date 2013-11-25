class Good < ActiveRecord::Base
  attr_accessible :checked, :repost_count, :text

  belongs_to :account
  validates :text, presence: true, length: {in: 10..100}

  def self.today
    where(created_at: Time.now.midnight..Time.now)
  end

  def user
    self.account.user
  end

  def self.unchecked
    find_all_by_checked(nil).to_a
  end

  #TODO: So, let's drop it out to decorators
  def self.checked_with_date
    find_all_by_checked(true).reverse.group_by{|good| good.created_at.to_date}
  end

  def self.checked
    find_all_by_checked(true).to_a
  end

end
