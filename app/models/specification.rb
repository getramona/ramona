# == Schema Information
#
# Table name: specifications
#
#  id          :integer          not null, primary key
#  pom         :string
#  measurement :string
#  unit        :integer          default("inches")
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_specifications_on_project_id  (project_id)
#

class Specification < ApplicationRecord
  include PublicActivity::Model

  enum unit: [:inches, :centimeters]

  belongs_to :project

  has_paper_trail

  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
