class UserContext
  attr_reader :user, :organization, :team

  def initialize(user, organization = nil, team = nil)
    @user = user
    @organization = organization
    @team = team
  end
end
