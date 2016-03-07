# == Schema Information
#
# Table name: uploads
#
#  id              :integer          not null, primary key
#  uploadable_id   :integer
#  uploadable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true

  validates :uploadable, presence: true
end
