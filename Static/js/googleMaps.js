
var map;
var marker;
console.log(marker)
function initMap(){
    map = new google.maps.Map(
    document.getElementById('my-map'), 
    {
        center: {lat: 37.788862, lng: -122.411540},
        zoom: 13
    });
    
}

function addMarker(evt){
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
    console.log(marker)
}
function removeMarkers(evt){
    marker.setMap(null);
}
$('.marker-me').on('mouseover', addMarker);
$('.marker-me').on('mouseout', removeMarkers);

