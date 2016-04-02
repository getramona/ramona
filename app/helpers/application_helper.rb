module ApplicationHelper
  def enable_nav(item)
    'nav__link--active' if content_for(:nav) == item
  end
end
