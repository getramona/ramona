class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  authenticates_with_sorcery!

  field :email, type: String
  field :username, type: String

  enum :role, [:user, :admin]

  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :teams

  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
