module Internationalization
  extend ActiveSupport::Concern

  included do
    around_action :set_locale

    private

    def set_locale(&action)
      locale = locale_verification || cookies[:locale] || I18n.default_locale
      save_locale_in_cookie(locale)
      I18n.with_locale(locale, &action)
    end

    def locale_verification
      locale = params[:locale]

      if I18n.available_locales.map(&:to_s).include?(locale)
        locale
      else
        nil
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end

    def save_locale_in_cookie(locale)
      if cookies[:locale] != locale
        cookies.permanent[:locale] = locale
      end
    end
  end
end
