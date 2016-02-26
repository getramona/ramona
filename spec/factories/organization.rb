FactoryGirl.define do
  sequence :domain do |n|
    "planetary#{n}.org"
  end

  factory :organization do
    name 'Planetary Society'
    domain
  end
end
