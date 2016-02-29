class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :attachable, polymorphic: true

  has_many :comments, as: :commentable
end
