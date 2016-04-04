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

class OrganizationsController < ApplicationController
  def index
    @organizations = current_user.organizations.order('name asc')

    render layout: 'card'
  end

  def show
  end
end
