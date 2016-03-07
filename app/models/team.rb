# == Schema Information
#
# Table name: teams
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  permalink       :string           not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Team < ApplicationRecord
  has_many :memberships, as: :group, dependent: :destroy
  has_many :users, through: :memberships

  belongs_to :organization

  validates :name, presence: true
  validates :permalink, presence: true, uniqueness: { scope: :organization_id }
  validates :organization, presence: true
end
