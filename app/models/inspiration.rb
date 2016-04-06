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
  belongs_to :project

  has_many :uploads, as: :uploadable
  has_many :comments, as: :commentable
end
