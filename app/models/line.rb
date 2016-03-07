# == Schema Information
#
# Table name: lines
#
#  id              :integer          not null, primary key
#  name            :string
#  season          :string
#  year            :string
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Line < ApplicationRecord
  belongs_to :organization

  has_many :garments
  has_many :uploads, as: :uploadable

  validates :name, presence: true, if: Proc.new { |line|
    line.season.blank? && line.year.blank?
  }
end
