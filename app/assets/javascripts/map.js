function initMap() {

  var myLatLng = {lat: 52.2053, lng: 0.1218};

  var mapDiv = document.getElementById('map');
  var map = new google.maps.Map(mapDiv, {
    center: myLatLng, zoom: 10
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: "Zareh's Orchid House"
  });
}