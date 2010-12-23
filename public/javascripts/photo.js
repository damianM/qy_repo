var Photo = $.inherit({
  __constructor: function() {
    $('#toggle_photo_form').livequery('click',$.delegate(this, this.togglePhotoForm));    

  },

  togglePhotoForm: function(src){
    $('#buttons').toggle();
    $('#photo_form').toggle();
   
    return false;
  }
 
}, {

});

jQuery(document).ready(function() {
  new Photo();
});


