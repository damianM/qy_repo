var GoogleMaps = $.inherit({
  __constructor : function() {
    $('#map').livequery($.delegate(this, this.showGoogleMap));
    $('#direction_window').livequery('click',$.delegate(this, this.openDirectionWindow));
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
            var companyDetailsHtml = "<div style='white-space:nowrap; font-family: Verdana, Tahoma, Arial, sans-serif; color: #154141; font-size: 1em;'>"+company_name+"<br/>"+address+"<br/><a id='direction_window' href='#' address='"+address+"'>zobacz kierunki</a></div>";

            GEvent.addListener(marker, 'click', function() {
              marker.openInfoWindowHtml(companyDetailsHtml);
            });
            marker.openInfoWindowHtml(address);
            GEvent.trigger(marker, 'click');
          }
        }
      );
    }
  },

	    
  openDirectionWindow: function(src) {
    var address = $(src).attr('address');
    openPopupWindow("http://maps.google.com/maps?daddr="+encodeURI(address.replace(/ /g,"+"))+"&hl=pl");
  }

}, {
	
});

jQuery(document).ready(function() {
  new GoogleMaps();
});




