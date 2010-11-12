var Video = $.inherit({
  __constructor: function() {
    this.JcUploadControl = new JcUploadControl();
  }
 
}, {

});

jQuery(document).ready(function() {
  new Video();
});



