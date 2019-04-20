class ApplicationController < ActionController::Base
  
  $LOCALES = [['English','/en'],
               ['Italiano', '/it'],
               ['Portugues','/pt'],
               ['Spanish', '/es'],
               ['German','/de'],
               ['French', '/fr']
              ];
  
  before_action :set_locale
  
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  self.per_form_csrf_tokens = true
  
  private
  
  # Before every request, we set the locale, from the specified or detected settings, or from the cookie
  def set_locale
    if language_change_necessary?
      I18n.locale = the_new_locale
      set_locale_cookie(I18n.locale)
    else
      use_locale_from_cookie
    end
  end

  # A locale change is necessary if no locale cookie is found, or if the locale param has been specified
  def language_change_necessary?
    return cookies.signed['locale'].nil? || params[:locale]
  end

  # The new locale is taken from the current_user language setting, it logged_in, or from the http accept language header if not
  # In both cases, if a locale param has been passed, it takes precedence. Only available locales are accepted
  def the_new_locale
    @arr_idioms = ['en','it','pt','es','de','fr']
    new_locale = (params[:locale] || extract_locale_from_accept_language_header)
    @arr_idioms.include?(new_locale) ? new_locale : I18n.default_locale.to_s
  end

  # Sets the locale cookie
  def set_locale_cookie(locale)
    cookies.permanent.signed['locale'] = locale.to_s
  end

  # Reads the locale cookie and sets the locale from it
  def use_locale_from_cookie
    I18n.locale = cookies.signed['locale']
  end

  # Extracts the locale from the accept language header, if found
  def extract_locale_from_accept_language_header
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first rescue I18n.default_locale
  end
  
  def default_url_options
    { :locale => I18n.locale }
  end
end
