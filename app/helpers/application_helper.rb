module ApplicationHelper
  def set_language_dropdown
    if I18n.locale == :en
      flag_icon(:eu)
    else
      flag_icon(:ru)
    end
  end
end
