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

  def icon_by_crew(crew)
    icon_by_crew = {
      "solo" => "fas fa-child",
      "family" => "fas fa-users",
      "couple" => "fas fa-male fas fa-female",
      "friend" => "fas fa-users"
    }

    return icon_by_crew[crew]
  end

  def icon_by_transportation(transportation)
    icon_by_transportation = {
      "car" => "fas fa-car-side",
      "bus" => "fas fa-bus",
      "plane" => "fas fa-plane-departure",
      "boat" => "fas fa-ship",
      "hitchhiking" => "fas fa-walking",
      "motorbike" => "fas fa-motorcycle"
    }

    return icon_by_transportation[transportation]
  end
end

