$(document).ready(function () {
  function init_map(){
    var myOptions = {
      zoom:16,
      center:new google.maps.LatLng(40.4382915,-3.681471800000054),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
    marker = new google.maps.Marker({
      map: map,
      position: new google.maps.LatLng(40.4382915,-3.681471800000054)});
    infowindow = new google.maps.InfoWindow({
      content:'<strong>BrickAPP</strong><br>Nuñez de Balboa 120, Madrid<br>'
    });
    google.maps.event.addListener(marker, 'click', function(){
      infowindow.open(map,marker);
    });
    infowindow.open(map,marker);
  }
  google.maps.event.addDomListener(window, 'load', init_map);
});

window.setTimeout(function() {
  $(".alert").fadeTo(500, 0).slideUp(500, function(){
    $(this).remove(); 
  });
}, 3000);

