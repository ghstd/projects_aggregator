ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  # Пример: Добавляем класс ошибки, но не оборачиваем в div
  if html_tag =~ /^<label/
    html_tag
  else
    # Добавляем класс field_with_errors к существующему тегу
    html = Nokogiri::HTML::DocumentFragment.parse(html_tag)
    element = html.at_css("input, textarea, select")

    if element
      element['class'] = "#{element['class']} field_with_errors".strip
      element.to_s.html_safe
    else
      html_tag
    end
  end
end
