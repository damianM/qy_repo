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

