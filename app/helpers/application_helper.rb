module ApplicationHelper

  def locale_switcher(locale)
    if locale == I18n.locale
      content_tag('span', locale.upcase)
    else
      link_to locale.upcase, locale_path(locale), :method => :put
    end
  end

  def new_edit_legend object
    "#{object.new_record? ? 'Create' : 'Edit'} #{object.class.name.downcase}"
  end

  def e params
    escape_javascript params
  end

end
