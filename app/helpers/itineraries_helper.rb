module ItinerariesHelper

  def link_to_toggle_itinerary_favorite(itinerary, user)

    if user.favorited_itineraries.include? itinerary and current_user
      favorite = Favorite.find_by(itinerary_id: itinerary.id, user_id: user.id)
      url = itinerary_favorite_path(itinerary, favorite)
      link_to('', url, {
        method: 'DELETE',
        remote: true,
        class: 'fa fa-star',
        id: 'fav_button'
      })
    else
      url = itinerary_favorites_path(itinerary)
      link_to('', url, {
        method: 'POST',
        remote: true,
        class: 'fa fa-star-o',
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
