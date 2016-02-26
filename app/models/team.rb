class Team
  include Mongoid::Document

  field :name, type: String

  belongs_to :organization

  has_and_belongs_to_many :users

  validates :name, presence: true
end
