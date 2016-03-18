FactoryGirl.define do
  factory :membership do
    group { create(:organization) }
    user

    trait :leader do
      role :leader
    end
  end
end
