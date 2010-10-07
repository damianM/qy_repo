function checkScreen(){
  if (screen.width==1024){
    $('page').style.width='1000px';
    $('main').style.marginLeft='25px';
    $('menu').style.left='25px';
    $('logo').style.marginLeft='500px';
    $('footer').style.marginLeft='25px';
    $('page').style.backgroundPosition= '-200px 0px';
  }   
  return false;
}


function showGoogleMap() {
  if (GBrowserIsCompatible()) {
    var map = new GMap2(document.getElementById("map"));
    map.setCenter(new GLatLng(53.400443, -6.182819), 13);
    map.setUIToDefault();

    var marker = new GMarker(new GLatLng(53.400443, -6.182819));
    var importDirectsHtml = "<div style='white-space:nowrap; font-family: Verdana, Tahoma, Arial, sans-serif; color: #154141; font-size: 1em;'>ImportsDirect,<br/>Clare Hall, Malahide Rd.,<br/>Dublin 17, Ireland</div>";

    GEvent.addListener(marker, 'click', function() {
      marker.openInfoWindowHtml(importDirectsHtml);
    });

    map.addOverlay(marker);
    GEvent.trigger(marker, 'click');
  }
}
