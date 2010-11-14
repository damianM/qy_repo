var Video = $.inherit({
  __constructor: function() {
    $('#toggle_video_form').livequery('click',$.delegate(this, this.toggleVideoForm));    
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



