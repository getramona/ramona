class CreateMembership < ApplicationInteraction
  object :current_user, class: User
  hash :membership do
    object :user
    object :organization, default: nil
    object :team, default: nil
    string :role, default: 'user'
  end

  def to_model
    Membership.new
  end

  def execute
    group = membership[:organization] || membership[:team]

    unless group
      errors.add(:membership, :not_present)

      return nil
    end

    authorize(current_user, group, :create?)

    return nil unless errors.messages.empty?

    _membership = Membership.new(
      user: membership[:user],
      group: group,
      role: membership[:role]
    )

    unless _membership.save
      errors.merge!(_membership.errors)
    end

    _membership
  end
end
