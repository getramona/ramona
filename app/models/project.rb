# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_projects_on_organization_id  (organization_id)
#

class Project < ApplicationRecord
  include PublicActivity::Model

  belongs_to :organization

  has_many :garments
  has_many :uploads, as: :uploadable
  has_many :specifications

  validates :name, presence: true

  has_paper_trail

  def activity
    PublicActivity::Activity.order('created_at desc').select do |a|
      if a.project
        a.trackable.project == self
      else
        false
      end
    end
  end
end
