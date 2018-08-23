module ApplicationHelper
  def get_duration(days)
    if days < 30
      "#{days} d"
    else
      "#{days.fdiv(30).round} m"
    end
  end
end
