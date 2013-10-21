FactoryGirl.define do
  factory :user do
    name { generate :string }
    avatar 'https://twimg.com/1.jpg'
  end
end