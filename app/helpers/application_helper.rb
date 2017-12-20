module ApplicationHelper

  def flash_class(level)
    case level
    when 'notice' then "alert alert-info fade show"
    when 'success' then "alert alert-success fade show"
    when 'error' then "alert alert-danger fade show"
    when 'alert' then "alert alert-danger fade show"
    end
  end

  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "card border-danger") do
        concat(content_tag(:div, class: "card-header bg-pink text-white") do
          concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
        end)
        concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg, class: 'list-group-item')
          end
        end)
      end
    end
  end
  
end
