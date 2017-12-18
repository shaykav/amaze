

$(document).on('turbolinks:load', function() {

  $(document).on('click', ".add-maze-btn", function(e){
    e.preventDefault();
    maze.appendForm();
  });

  $(document).on('click', ".remove-form", function(e){
    e.preventDefault();
    maze.deleteForm(this);
  });

  $(document).on('click', ".submit-itinerary", function(e){
    // $('#itinerary_locations').val(JSON.stringify(locations));
  });

});

var locations = []

var maze = {
  appendForm: function(){
    var formContainer = $("template").html(),
    clonedForm = $(formContainer);

    clonedForm.find(".remove-form").attr('data-id', +new Date)
    $('.maze-form').append(clonedForm)
    initMap( clonedForm.find(".pac-input:visible") )
  },
  deleteForm: function(el){
    var timeStamp = Number($(el).attr('data-id'))
    if (locations.length > 0) {
      locations.forEach(function(value){
        if (value.timestamp === timeStamp ){
          maze.remove(locations, value);
          $(el).closest(".new-wrapper").remove();
        }
      });
    }else {
      $(el).closest(".new-wrapper").remove();
    }
  },
  remove: function(array, element) {
    const index = array.indexOf(element);
    array.splice(index, 1);
  }


}



function initMap(field) {
  var field = field || ".pac-input";
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -33.8688, lng: 151.2195},
    zoom: 13
  });

  if (field instanceof jQuery) {
    var inputs = field.get();
  }else{
    var inputs = document.querySelectorAll(field);
  }

  inputs.forEach(function(input){
    var autocomplete = new google.maps.places.Autocomplete(input);

    var infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.getElementById('infowindow-content');
    infowindow.setContent(infowindowContent);
    var marker = new google.maps.Marker({
      map: map,
      anchorPoint: new google.maps.Point(0, -29)
    });

    autocomplete.addListener('place_changed', function(event) {

      infowindow.close();
      marker.setVisible(false);
      var place = autocomplete.getPlace();
      var photo = place.photos[0].getUrl({
        maxWidth: 400
      });
      var website = place.website
      var address = place.formatted_address
      var icon = place.icon
      var title = place.name


      console.log(place)
      console.log(place.photos[0].getUrl({
        maxWidth: 400
      }));
      console.log(website)


      var lat = place.geometry.location.lat();
      var lng = place.geometry.location.lng();

      var $input = $(this.gm_accessors_.place.Kc.gm_accessors_.input.Kc.b),
      isNewWrapper = ($input.attr("data-is-new") === "true");

      if (isNewWrapper) {
        var tStamp = $input.closest(".new-wrapper").find(".remove-form").attr('data-id');

        locations.push({timestamp: Number(tStamp), lat, lng})
        $input.closest(".new-wrapper").find("[name='itinerary[content][][location]']")
        .val(JSON.stringify({lat, lng}))

      }else {
        locations.push({timestamp: (+new Date), lat, lng})
        $input.closest('.form-container').find("[name='itinerary[content][][location]']")
        .val(JSON.stringify({lat, lng}))
      }
      
      $input.closest('.form-container').find("[name='itinerary[content][][photo]']")
      .val(photo)

      $input.closest('.form-container').find("[name='itinerary[content][][icon]']")
      .val(icon)

      $input.closest('.form-container').find("[name='itinerary[content][][address]']")
      .val(address)

      $input.closest('.form-container').find("[name='itinerary[content][][website]']")
      .val(website)

      $input.closest('.form-container').find("[name='itinerary[content][][title]']")
      .val(title)

      if (!place.geometry) {
        // User entered the name of a Place that was not suggested and
        // pressed the Enter key, or the Place Details request failed.
        window.alert("No details available for input: '" + place.name + "'");
        return;
      }

      infowindowContent.children['place-icon'].src = place.icon;
      infowindowContent.children['place-name'].textContent = place.name;
      infowindowContent.children['place-address'].textContent = address;
      infowindow.open(map, marker);
    })
  });
}
