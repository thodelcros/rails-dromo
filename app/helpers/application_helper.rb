module ApplicationHelper
  def get_duration(days)
    if days < 30
      "#{days} d"
    else
      "#{days.fdiv(30).round} m"
    end
  end

  def icon_by_category(category)
    icon_by_cat = {
      'food' => "fas fa-utensils",
      'nature' => "fas fa-leaf",
      'sport' => "fas fa-bicycle",
      'party' => "fas fa-cocktail",
      'housing' => "fas fa-home",
      'vantage point' => "fas fa-eye"
    }

    return icon_by_cat[category]
  end
end
