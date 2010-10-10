var Ad = $.inherit({
  __constructor : function() {
    $('#sale_ad_ad_type_id').livequery('change',$.delegate(this, this.onChangeAdType));
    $('#sale_ad_ad_type_id').livequery($.delegate(this, this.onChangeAdType));
  },

  onChangeAdType: function(src) { 
    var selected_option = $(src).find("option:selected").text();

    if (selected_option == 'Quad'){
      $('#quad_fields').show();
    } else {
      $('#quad_fields').hide();
    }
    return false;
  }	   

}, {
	
});

jQuery(document).ready(function() {
  new Ad();
});

  
