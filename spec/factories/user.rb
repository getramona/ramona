FactoryGirl.define do
  sequence :email do |n|
    "bill#{n}@planetary.org"
  end

  sequence :username do |n|
    "bill#{n}"
  end

  factory :user do
    email
    username
    password 'iloveplanets'
  end
end
