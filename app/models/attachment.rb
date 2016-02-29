class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :attachable, polymorphic: true
end
