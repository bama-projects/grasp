module FormErrorHelper
  def handle_form_error(field, object)
    if object.errors[field].present?
      content_tag(:div, class: 'error') do
        "#{field.capitalize} #{object.errors[field][0]}."
      end
    end
  end
end
