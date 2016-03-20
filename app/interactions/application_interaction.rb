class ApplicationInteraction < ActiveInteraction::Base
  def authorize(user, record, query = nil)
    begin
      Pundit.send :authorize, user, record, query
    rescue Pundit::NotAuthorizedError
      errors.add(:current_user, :not_allowed)

      return nil
    end
  end
end
