# == Schema Information
#
# Table name: inspirations
#
#  id         :integer          not null, primary key
#  title      :string
#  notes      :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_inspirations_on_project_id  (project_id)
#

class Inspiration < ApplicationRecord
  include PublicActivity::Model

  belongs_to :project

  has_one :upload, as: :uploadable
  has_many :comments, as: :commentable

  has_paper_trail
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
