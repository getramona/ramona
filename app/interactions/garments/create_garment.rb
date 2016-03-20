class CreateGarment < ApplicationInteraction
  object :current_user, class: User
  hash :garment do
    object :line
    string :name
    string :description, default: nil
  end

  def to_model
    Garment.new
  end

  def execute
    _garment = Garment.new(garment)

    authorize(current_user, _garment, :create?)

    return nil unless errors.messages.empty?

    unless _garment.save
      errors.merge!(_garment.errors)
    end

    _garment
  end
end
