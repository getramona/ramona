# == Schema Information
#
# Table name: specifications
#
#  id          :integer          not null, primary key
#  pom         :string
#  measurement :string
#  unit        :integer          default(0)
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_specifications_on_project_id  (project_id)
#

class Specification < ApplicationRecord
  enum unit: [:inches, :centimeters]

  belongs_to :project
end
