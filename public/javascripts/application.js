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


function startProcedures(){
  if (($('flash') != null)){
      Effect.Fade('flash',{duration: 4.0});
  }
  checkScreen();
}


function makeWorkshopMain(workshop_id){
  new Ajax.Request('/workshops/make_main/'+workshop_id, {async:true, evalScripts:true});
  elements = document.getElementsByClassName('main_workshops');

  for (var i=0; i< elements.length; i++) {
    elements[i].checked = false;
  }

  $('main_workshop_'+workshop_id).checked = true;
  return false;
}

