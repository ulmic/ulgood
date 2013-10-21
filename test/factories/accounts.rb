FactoryGirl.define do
  factory :account do
    user
    provider { generate :provider }
    uid { generate :string }
  end
end