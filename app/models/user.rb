class User
  include Mongoid::Document

  authenticates_with_sorcery!

  field :email, type: String
  field :username, type: String

  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :teams

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
