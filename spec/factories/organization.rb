FactoryGirl.define do
  sequence :subdomain do |n|
    "planetary#{n}"
  end

  factory :organization do
    name 'Planetary Society'
    subdomain
  end
end
