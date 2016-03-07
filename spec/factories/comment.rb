FactoryGirl.define do
  factory :comment do
    text 'Working hard? Hardly working!'
    user
    commentable { create(:upload) }
  end
end
