class Line
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :organization

  has_many :garments
  has_many :attachments, as: :attachable
end
