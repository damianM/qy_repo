var Application = $.inherit({
  __constructor : function() {
    $("#flash").live("click",this.hideFlash).livequery($.delegate(this, function(src){$(src).oneTime("5s",this.hideFlash)}));    
  },

  clearForm: function(src){
    var form, elements, i, elm; 
    var formIdent = $(src).attr('formIdent');
    form = document.getElementById ? document.getElementById(formIdent) : document.forms[formIdent]; 

    if (document.getElementsByTagName) {
	elements = form.getElementsByTagName('input');
	for( i=0, elm; elm=elements.item(i++); ) {
	    if (elm.getAttribute('type') == "text") {
		elm.value = '';
	    } else if (elm.getAttribute('type') == "checkbox" || elm.getAttribute('type') == "radio") {
		elm.checked = false;
	    } 
	}
	
	elements = form.getElementsByTagName('select');
	for( i=0, elm; elm=elements.item(i++); ) {
	    elm.options.selectedIndex=0;
	}
	
	elements = form.getElementsByTagName('textarea');
	for( i=0, elm; elm=elements.item(i++); ) {
	    elm.value='';
	}
	
    } else {
	elements = form.elements;
	
	for( i=0, elm; elm=elements[i++]; ) {
	    if (elm.type == "text") {
		elm.value ='';
	    } else if (elm.type == "checkbox" || elm.type == "radio") {
		elm.checked = false;
	    }
	}
    }
  },

  hideFlash: function() {
    $(this).fadeOut("slow",function(){                                                                                                                                 
      $(this).hide();           
    });                            
    return false;                                                                                                                                                       
  }

}, {

  validate: function(src, obj) {
    $(src).validate(obj);
  },

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
  }

});

jQuery(document).ready(function() {
  new Application();
});

function startProcedures(){
  if (screen.width==1024){
    $('#page').style.width='1000px';
    $('#main').style.marginLeft='25px';
    $('#menu').style.left='25px';
    $('#logo').style.marginLeft='500px';
    $('#footer').style.marginLeft='25px';
    $('#page').style.backgroundPosition= '-200px 0px';
  }   
  return false;
}