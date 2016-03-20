class UpdateLine < ApplicationInteraction
  object :current_user, class: User
  hash :line do
    object :line
    string :name, :season, :year, default: nil
  end

  def to_model
    line[:line]
  end

  def execute
    _line = line[:line]

    authorize(current_user, _line, :update?)

    return nil unless errors.messages.empty?

    _line.name = line[:name] if line[:name]
    _line.season = line[:season] if line[:season]
    _line.year = line[:year] if line[:year]

    unless _line.save
      errors.merge!(_line.errors)
    end

    _line
  end
end
