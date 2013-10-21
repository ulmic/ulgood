require 'test_helper'

class GoodTest < ActiveSupport::TestCase

  test "should create good" do
    good = FactoryGirl.create :good
    assert_not_nil good
  end

  test "should validate text" do
    good = FactoryGirl.build :good
    good.text = ""
    assert_not_nil good.errors[:text]
  end

  test "should validate text length" do
    good = FactoryGirl.build :good
    good.text = "too few"
    assert_not_nil good.errors[:text]
    good.text = "seems to be enough"
    assert good.valid?
    good.text = "seems to be too looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong"
    assert_not_nil good.errors[:text]
  end

end
