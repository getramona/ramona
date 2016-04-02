# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :organization

  has_many :garments
  has_many :uploads, as: :uploadable

  validates :name, presence: true
end
