# == Schema Information
#
# Table name: garments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Garment < ApplicationRecord
  enum approval_status: [ :in_progress, :pending, :approved ]

  belongs_to :project

  has_many :uploads, as: :uploadable
  has_many :comments, as: :commentable
end
