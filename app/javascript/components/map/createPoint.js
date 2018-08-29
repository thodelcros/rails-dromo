function listenForPointCreation() {
  const form = document.getElementById('new_point');
  form.addEventListener('submit', createPoint)
}

function createPoint(submitEvent){
  submitEvent.preventDefault();

  const form      = submitEvent.target;
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const submissionUrl = form.action;
  const data          = JSON.stringify({city: form.elements.point_city.value});
  fetch(submissionUrl, {
    method: "POST",
    body: data,
    headers: {
      "Accept":       "application/json",
      "Content-Type": "application/json",
      'X-CSRF-Token': csrfToken
    },
    credentials: 'same-origin'
  })
  .then(response => response.json())
  .then(function(data){
    addPointToList(data);
    enableSubmitInput(form);
    addPointToMap(data);
  });
}

function addPointToMap(data) {
  const position = { lat: data.lat, lng: data.lng }
  data.animation = google.maps.Animation.DROP;

  // mapObj added in map.js accessible through window global state
  // could not make it work without it
  const marker = mapObj.addMarker(data);

  mapObj.setCenter(position);
}

function addPointToList(data) {
  const pointsList = document.getElementById('points');

  pointsList.insertAdjacentHTML('beforeend', data.cardMarkup.content);
}

function enableSubmitInput(form) {
  form.commit.disabled  = false;
  form.point_city.value = null;
}

export { listenForPointCreation };
