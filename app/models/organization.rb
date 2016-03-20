# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  subdomain  :string           not null
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  has_many :memberships, as: :group, dependent: :destroy
  has_many :users, through: :memberships
  has_many :teams
  has_many :lines

  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true
end
