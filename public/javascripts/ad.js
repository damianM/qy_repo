var Ad = $.inherit({
  __constructor : function() {

    $("select#ad_type").livequery('change',$.delegate(this, this.changeAdType));     
  },
  
  changeAdType: function(src){
    if ($(src).val() == 'sale_ad'){
      window.location = '/sale_ads/new';
    } else {
      window.location = '/buy_ads/new';
    }
  }


}, {
	
});

jQuery(document).ready(function() {
  new Ad();
});

  
