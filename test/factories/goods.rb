FactoryGirl.define do
  factory :good do
    account
    text { generate :string }
  end
end