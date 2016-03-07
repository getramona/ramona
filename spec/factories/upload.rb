FactoryGirl.define do
  factory :upload do
    uploadable { create(:garment) }
  end
end
