class UpdateGarment < ApplicationInteraction
  object :current_user, class: User
  hash :garment do
    object :garment
    string :name, default: nil
    string :description, default: nil
  end

  def to_model
    garment[:garment]
  end

  def execute
    _garment = garment[:garment]

    authorize(current_user, _garment, :update?)

    return nil unless errors.messages.empty?

    _garment.name = garment[:name] if garment[:name]
    _garment.description = garment[:description] if garment[:description]

    unless _garment.save
      errors.merge!(_garment.errors)
    end

    _garment
  end
end
