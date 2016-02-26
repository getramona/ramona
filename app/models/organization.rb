class Organization
  include Mongoid::Document

  field :name, type: String
  field :domain, type: String

  has_and_belongs_to_many :users

  has_many :teams

  validates :name, presence: true
  validates :domain, presence: true
end
