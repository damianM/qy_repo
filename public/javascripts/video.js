var Video = $.inherit({
  __constructor: function() {
    $('#toggle_video_form').livequery('click',$.delegate(this, this.toggleVideoForm));    

    $("div.rating_box").livequery($.delegate(this,this.ratingStars));
  },

  ratingStars: function(src) {
    $(src).children('.rating_star').rating({
      required: false,
      callback: function(value, link){
        var object_id = $(src).attr('id').match(/\d+/);
	$.post('/'+$(src).attr('rating_object')+'/rate/'+object_id, { value: value }, function(response) {
	  if(response.success) {
	    $("#rating_box_"+response.object_id).remove();
	    $("span.rating").replaceWith(response.content);
	    FlashMessage.response(response);
	    return false;
	  }
	}, 'json');
        return false;   
      }
    });

    return false;
  },

  toggleVideoForm: function(src){
    $('#buttons').toggle();
    $('#video_form').toggle();
   
    return false;
  }
 
}, {

});

jQuery(document).ready(function() {
  new Video();
});



