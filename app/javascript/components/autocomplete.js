function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var itineraryStep = document.getElementById('step_city');

    if (itineraryStep) {
      var autocomplete = new google.maps.places.Autocomplete(itineraryStep, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(itineraryStep, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
