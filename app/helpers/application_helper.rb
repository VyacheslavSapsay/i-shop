module ApplicationHelper
  def set_language_dropdown
    if I18n.locale == :en
      flag_icon(:eu)
    else
      flag_icon(:ru)
    end
  end

  def full_price(item)
    item.quantity * item.product.price
  end
  def header_must_be
    current_page?(root_url, check_parameters: true)
  end
end
