module ApplicationHelper
  include Pagy::Frontend

  def pagination(obj)
    # raw(pagy_nav(obj)) if obj.pages > 1
    result = pagy_nav(obj) do |page|
      if page.prev?
        page.prev.link(class: 'page-link')
      end
      page.each do |link|
        link.link(class: 'page-link')
      end
      if page.next?
        page.next.link(class: 'page-link')
      end
    end

    raw(result)
  end
end
