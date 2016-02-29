class Organization
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :domain, type: String

  has_and_belongs_to_many :users

  has_many :teams
  has_many :lines

  validates :name, presence: true
  validates :domain, presence: true
end
