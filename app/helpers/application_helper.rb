module ApplicationHelper
  include Pagy::Frontend

  def current_page_tab_title(page_title)
    base_title = ENV["APP_NAME"]
    if page_title.present?
      page_title + " | " + base_title
    else
      base_title
    end
  end

  def nav_link(title, url, options = {})
    current_page = options.delete(:current_page)
    css_class = current_page == title ? "navigation__link--active" : ""

    if options[:class].present?
      options[:class] = [options[:class], css_class].join(" ")
    else
      options[:class] = css_class
    end

    link_to title, url, options
  end

  def sort_item_class(sort_param)
    default_sort = '0'

    if params[:sort].present?
      params[:sort] == sort_param ? "sort__link--active" : ""
    else
      default_sort == sort_param ? "sort__link--active" : ""
    end
  end

  def pagination(obj)
    raw(pagy_nav(obj)) if obj.pages > 1
  end

  def current_url_whith_locale(locale)
    url_for(request.query_parameters.merge(locale: locale))
  end

  def get_theme_from_cookie
    current_theme = cookies[:theme]
    default_theme = 'dark'
    if current_theme.present?
      current_theme
    else
      default_theme
    end
  end

  def previous_page_url
    if request.referer.present? && request.referer.start_with?(request.base_url)
      request.referer
    else
      root_path
    end
  end

  def gravatar(obj, css_class = '', size = 30)

    params = URI.encode_www_form('s' => size)
    src = "https://www.gravatar.com/avatar/#{obj.gravatar_hash}?#{params}"

    image_tag src, class: css_class, alt: "gravatar image"
  end

  def append_flash
    turbo_stream.append 'flash_container', partial: 'partials/flash_messages'
  end
end
