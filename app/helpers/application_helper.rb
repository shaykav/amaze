module ApplicationHelper

  def flash_class(level)
    case level
    when 'notice' then "alert alert-info fade show"
    when 'success' then "alert alert-success fade show"
    when 'error' then "alert alert-danger fade show"
    when 'alert' then "alert alert-danger fade show"
    end
  end
  
end
