module ApplicationHelper

  def locale_switcher(locale)
    if locale == I18n.locale
      locale.upcase
    else
      link_to locale.upcase, locale_path(locale), :method => :put
    end
  end

end
