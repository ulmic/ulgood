include ActionDispatch::TestProcess

FactoryGirl.define do

  sequence :string do |n|
    "more than 10 chars string-#{n}"
  end

  sequence :provider do |n|
    "twitter"
  end
end