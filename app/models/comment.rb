# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  text             :text
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_user_id  (user_id)
#

class Comment < ApplicationRecord
  include PublicActivity::Model
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :text, presence: true
  validates :commentable, presence: true
  validates :user, presence: true

  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
