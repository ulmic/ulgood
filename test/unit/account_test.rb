require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "should create account" do
    account = FactoryGirl.create :account
    assert_not_nil account
  end

  test "should validate provider" do
    account = FactoryGirl.build :account
    account.provider = "dsa"
    assert_not_nil account.errors[:provider]
  end

  test "should validate uid presence" do
    account = FactoryGirl.build :account
    account.uid = ""
    assert_not_nil account.errors[:uid]
  end

  test "should validate uid uniqueness" do
    account_1 = FactoryGirl.create :account
    account_2 = account_1
    assert_not_nil account_2.errors[:uid]
  end

end
