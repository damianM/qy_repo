var GoogleMaps = $.inherit({
  __constructor : function() {
    $('#map').livequery($.delegate(this, this.showGoogleMap));
  },

  showGoogleMap: function(src) { 
   if (GBrowserIsCompatible()) {
      var map = new GMap2(document.getElementById("map"));
      var geocoder = new GClientGeocoder();
      map.setUIToDefault();

      var address = $(src).attr('address');
      var company_name = $(src).attr('company_name');    

      geocoder.getLatLng(
        address,
        function(point) {
          if (!point) {
            alert(address + " not found");
          } else {
            map.setCenter(point, 13);
            var marker = new GMarker(point);
            map.addOverlay(marker);
            var companyDetailsHtml = "<div style='white-space:nowrap; font-family: Verdana, Tahoma, Arial, sans-serif; color: #154141; font-size: 1em;'>"+company_name+"<br/>"+address+"</div>";
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

}, {
	
});

jQuery(document).ready(function() {
  new GoogleMaps();
});




