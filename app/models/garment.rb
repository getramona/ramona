class Garment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :line

  has_many :comments, as: :commentable
  has_many :attachments, as: :attachable
end
