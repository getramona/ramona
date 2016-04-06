FactoryGirl.define do
  factory :inspiration do
    project

    before(:create) do |inspiration|
      inspiration.upload = create(:upload, uploadable: inspiration)
    end
  end
end
