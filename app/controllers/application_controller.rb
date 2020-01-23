class ApplicationController < ActionController::Base
    before_action :set_locale

  def current_user_exist?
    redirect_back(fallback_location: root_path) if current_user
  end

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def create_or_set_cart
    if current_user && Cart.find_by_user_id(current_user&.id).nil?
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
    end
  end

end
