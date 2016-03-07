# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  group_id   :integer          not null
#  group_type :string           not null
#  role       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ActiveRecord::Base
  belongs_to :group, polymorphic: true
  belongs_to :user
end
