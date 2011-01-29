var Ad = $.inherit({
  __constructor : function() {

    $("select#ad_type").livequery('change',$.delegate(this, this.changeAdType));     

    $("input[type=checkbox].sale_ad_day_offer").livequery('click',$.delegate(this, this.onChooseDayOffer));     
    $("input[type=checkbox].sale_ad_special_offer").livequery('click',$.delegate(this, this.onChooseSpecialOffer));     
  },
  
  changeAdType: function(src){
    if ($(src).val() == 'sale_ad'){
      window.location = '/sale_ads/new';
    } else {
      window.location = '/buy_ads/new';
    }
  },

  onChooseDayOffer: function(src){
    var ad_id = $(src).val();

    $.get('/sale_ads/set_day_offer/'+ad_id, {}, this.onSuccessChooseDayOffer, 'json');
  },

  onSuccessChooseDayOffer: function(response){
    if (response.success){
      $('.sale_ad_day_offer').each(function(index,element){
        $(element).attr('checked',false);
      });
      $('#sale_ad_day_offer_'+response.sale_ad_id).attr('checked',true);
    }    
    return false;
  },

  onChooseSpecialOffer: function(src){
    var ad_id = $(src).val();

    $.get('/sale_ads/set_special_offer/'+ad_id, {}, this.onSuccessChooseSpecialOffer, 'json');
  },

  onSuccessChooseSpecialOffer: function(response){
    return true;
  }

}, {
	
});

jQuery(document).ready(function() {
  new Ad();
});

  
