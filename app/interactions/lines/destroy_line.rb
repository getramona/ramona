class DestroyLine < ApplicationInteraction
  object :current_user, class: User
  hash :line do
    object :line
  end

  def to_model
    line[:line]
  end

  def execute
    _line = line[:line]

    authorize(current_user, _line, :destroy?)

    return nil unless errors.messages.empty?

    _line.destroy
    
    _line
  end
end
