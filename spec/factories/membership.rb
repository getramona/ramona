FactoryGirl.define do
  factory :membership do
    group { create(:organization) }
    user
  end
end
