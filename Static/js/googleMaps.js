
var map;
var marker;
console.log(marker)
function initMap(){
    map = new google.maps.Map(
    document.getElementById('my-map'), 
    {
        center: {lat: 37.788862, lng: -122.411540},
        zoom: 12
    });
    
}

function addMarker(evt){
    //check if marker is within bounds, else move it 

    var infoWindow = new google.maps.InfoWindow();
    var bounds = new google.maps.LatLngBounds();
    var latFromDom = $(this).data('lat');
    console.log(latFromDom)
    var lngFromDom = $(this).data('lng');
    console.log(lngFromDom)
    var myLatLng = {lng: Number(lngFromDom), lat: Number(latFromDom)};
    console.log(myLatLng)
    marker = new google.maps.Marker(
            {
                position: myLatLng,
                map: map,
                title: 'Hello World!'
            }
    );
    bounds.extend(marker.position);
    console.log(marker)
    map.fitBounds(bounds);
    map.setZoom(13)
}
function removeMarkers(evt){
    marker.setMap(null);
}
$('.marker-me').on('mouseover', addMarker);
$('.marker-me').on('mouseout', removeMarkers);

