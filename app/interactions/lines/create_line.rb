class CreateLine < ApplicationInteraction
  object :current_user, class: User
  hash :line do
    object :organization
    string :name, :season, :year
  end

  def to_model
    Line.new
  end

  def execute
    _line = Line.new(line)

    authorize(current_user, _line, :create?)

    return nil unless errors.messages.empty?

    unless _line.save
      errors.merge!(_line.errors)
    end

    _line
  end
end
