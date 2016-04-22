# == Schema Information
#
# Table name: uploads
#
#  id              :integer          not null, primary key
#  uploadable_id   :integer
#  uploadable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  file            :string
#

class Upload < ApplicationRecord
  include PublicActivity::Model

  mount_uploader :file, FileUploader

  belongs_to :uploadable, polymorphic: true

  has_many :comments, as: :commentable

  validates :uploadable, presence: true

  has_paper_trail
end
