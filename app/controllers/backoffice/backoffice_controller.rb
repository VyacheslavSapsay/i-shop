# frozen_string_literal: true

class Backoffice::BackofficeController < ActionController::Base
  layout 'backoffice.html.erb'
  before_action :set_locale

  def current_user_exist?
    redirect_to home_path if current_user.present?
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

  def admin?
    redirect_to root_path unless current_user&.admin
  end
end
