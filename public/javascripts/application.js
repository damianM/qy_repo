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


function showGoogleMap(address) {
  alert(address);  
  if (GBrowserIsCompatible()) {
    var map = new GMap2(document.getElementById("map"));
    var geocoder = new GClientGeocoder();
    map.setUIToDefault();


    geocoder.getLatLng(
      address,
      function(point) {
        if (!point) {
          alert(address + " not found");
        } else {
          map.setCenter(point, 13);
          var marker = new GMarker(point);
          map.addOverlay(marker);
          var companyDetailsHtml = "<div style='white-space:nowrap; font-family: Verdana, Tahoma, Arial, sans-serif; color: #154141; font-size: 1em;'>Firma,<br/>"+address+"</div>";
          GEvent.addListener(marker, 'click', function() {
            marker.openInfoWindowHtml(companyDetailsHtml);
          });
          marker.openInfoWindowHtml(address);
          GEvent.trigger(marker, 'click');
        }
      }
    );
  }
}
