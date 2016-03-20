class DestroyGarment < ApplicationInteraction
  object :current_user, class: User
  hash :garment do
    object :garment
  end

  def to_model
    Garment.new
  end

  def execute
    _garment = garment[:garment]

    authorize(current_user, _garment, :destroy?)

    return nil unless errors.messages.empty?

    _garment.destroy

    _garment
  end
end
