FactoryGirl.define do
  sequence :permalink do |n|
    "designers#{n}"
  end

  factory :team do
    name 'Designers'
    permalink

    organization
  end
end
