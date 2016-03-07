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

class Organization < ActiveRecord::Base
  has_many :memberships, as: :group, dependent: :destroy
  has_many :users, through: :memberships
  has_many :teams
end
