# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  permalink  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :memberships, as: :group, dependent: :destroy
  has_many :users, through: :memberships

  belongs_to :organization
end
