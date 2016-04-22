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
# Indexes
#
#  index_teams_on_organization_id  (organization_id)
#

class Team < ApplicationRecord
  include PublicActivity::Model

  has_many :memberships, as: :group, dependent: :destroy
  has_many :users, through: :memberships

  belongs_to :organization

  validates :name, presence: true
  validates :permalink, presence: true, uniqueness: { scope: :organization_id }
  validates :organization, presence: true

  has_paper_trail
end
