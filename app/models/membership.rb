# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  group_id   :integer          not null
#  group_type :string           not null
#  role       :integer          default("user")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_memberships_on_group_id_and_group_type  (group_id,group_type)
#  index_memberships_on_user_id                  (user_id)
#

class Membership < ApplicationRecord
  include PublicActivity::Model

  enum role: [:user, :leader]

  belongs_to :group, polymorphic: true
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
end
