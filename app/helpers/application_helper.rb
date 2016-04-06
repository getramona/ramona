module ApplicationHelper
  def enable_nav(item)
    'nav__link--active' if content_for(:nav) == item
  end

  def enable_sidebar(item, value)
    'nav__link--active' if item == value
  end
end
