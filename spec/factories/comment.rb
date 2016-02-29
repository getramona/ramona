FactoryGirl.define do
  factory :comment do
    text 'Comment!'
    user
  end
end
