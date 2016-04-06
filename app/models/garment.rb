# == Schema Information
#
# Table name: garments
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :string
#  project_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  approval_status :integer          default("in_progress")
#  sku             :string
#
# Indexes
#
#  index_garments_on_project_id  (project_id)
#

class Garment < ApplicationRecord
  enum approval_status: [ :in_progress, :pending, :approved ]

  belongs_to :project

  has_many :uploads, as: :uploadable
  has_many :comments, as: :commentable
end
