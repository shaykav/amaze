module ItinerariesHelper

  def link_to_toggle_itinerary_favorite(itinerary, user)

    if user.favorited_itineraries.include? itinerary
      favorite = Favorite.find_by(itinerary_id: itinerary.id, user_id: user.id)
      url = itinerary_favorite_path(itinerary, favorite)
      link_to('Favorite', url, {
        method: 'DELETE',
        remote: true,
        class: 'favorite btn btn-primary btn-rounded',
        id: 'fav_button'
      })
    else
      url = itinerary_favorites_path(itinerary)
      link_to('Favorite', url, {
        method: 'POST',
        remote: true,
        class: 'favorite btn btn-outline-primary btn-rounded waves-effect',
        id: 'fav_button'
      })
    end
  end

  def link_to_with_icon(icon_css, title, url, options = {})
    icon = content_tag(:i, nil, class: icon_css)
    title_with_icon = icon << ' '.html_safe << h(title)
    link_to(title_with_icon, url, options)
  end


end
