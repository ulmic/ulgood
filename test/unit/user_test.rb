require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should create user" do
    user = FactoryGirl.create :user
    assert_not_nil user
  end

  test "should validate name" do
    user = FactoryGirl.build :user
    user.name = ""
    assert_not_nil user.errors[:name]
  end

  test "should validate avatar" do
    user = FactoryGirl.build :user
    user.avatar = "s"
    assert_not_nil user.errors[:avatar]
  end

end
