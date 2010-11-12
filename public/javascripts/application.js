var Application = $.inherit({
  __constructor : function() {


  },

  hideFlash: function() {
    $(this).fadeOut("slow",function(){
      $(this).remove();
    });
    return false;
  }

}, {
  redirect: function(response) {
    if(response.redirect_to){
       window.location.href = response.redirect_to;
    } else {
       Application.reloadPage(); 
    }
  },
  
  reloadPage: function() {
    window.location.href = window.location.href;
  },

  openNewPage: function(response) {
    window.open(response.redirect_to);
    return false;
  },

  validate: function(src, obj) {
    $(src).validate(obj);
  }

});

jQuery(document).ready(function() {  
  new Application();
});


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



