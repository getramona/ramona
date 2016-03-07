# == Schema Information
#
# Table name: garments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  line_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Garment < ActiveRecord::Base
  belongs_to :line

  has_many :uploads, as: :uploadable
end
