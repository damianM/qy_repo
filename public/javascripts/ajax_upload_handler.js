var AjaxUploadHandler = $.inherit({
  __constructor: function() {

    this.ajaxUpload = null;
    
    this.AJAX_UPLOAD_SETTINGS = {
      action: '',
      name: 'uploaded_data',
      data: {},
      hoverClass: 'upload_button_hover',		

      autoSubmit: true,
      responseType: 'json',

      onChange: AjaxUploadHandler.onChange,       
      onSubmit: AjaxUploadHandler.onSubmit,
      onComplete: AjaxUploadHandler.onComplete
    };

    AjaxUploadHandler.ajaxUploadForm().livequery($.delegate(this, this.initAjaxUpload));

    $("ul#assets li a#destroy_asset").livequery("click", $.delegate(this, this.onDestroyAsset));
  },
  
  initAjaxUpload: function(src) {
    var settings = $.extend({}, this.AJAX_UPLOAD_SETTINGS);
    settings.action = $(src).attr('action')+ "?" + $(src).serialize();
    settings.upload_button_id = $(src).children('input[type=file]').attr('id');
    this.ajax_upload = new AjaxUpload(settings.upload_button_id, settings);
    
    AjaxUploadHandler.setFormVisibility();
    return false;
  },
  
  onDestroyAsset: function(src) {
    if(confirm("Czy jesteś pewien?")) {
      var asset_id = $(src).parents('li.asset').attr('id').match(/\d+/);
      $.post($(src).attr('rel'), { id: asset_id, _method: "DELETE" }, this.onSuccessDestroyAsset, "json");
    }
    return false;
  },

  onSuccessDestroyAsset: function(response) {
    if (response.success) {
      $('ul#assets li#asset_'+response.id).remove();
      AjaxUploadHandler.setFormVisibility();
    }

    $('#flash').show();
    $('#flash').html("<div id='notice'>"+response.message+"</div>");
    return false;
  }

}, {

  onChange: function(file, extension){
    // Fired after the file is selected
    // Useful when autoSubmit is disabled
    // You can return false to cancel upload
    // @param file basename of uploaded file
    // @param extension of that file

  },

  onSubmit: function(file, extension) {
    // Fired before the file is uploaded
    // You can return false to cancel upload
    // @param file basename of uploaded file
    // @param extension of that file

    //if (!(extension && /^(jpg|png|jpeg|gif|swf|pdf|doc)$/i.test(extension)) ) {
    //  AjaxUploadHandler.ajaxUploadNotificationBox().addClass('error').html('Nie poprawne rozszerzenie pliku!');
    //  return false;
    // }
    //else {
    // AjaxUploadHandler.ajaxUploadNotificationBox().removeClass('error').ajaxLoader();
    // }
  },

  onComplete: function(file, response) {
    // Fired when file upload is completed
    // WARNING! DO NOT USE "FALSE" STRING AS A RESPONSE!
    // @param file basename of uploaded file
    // @param response server response
    AjaxUploadHandler.ajaxUploadNotificationBox().html('');

    if(response.success) {
      $.get('/assets/asset/'+response.asset_id, {}, function(resp) {
        if(resp.success) {
          $('ul#assets').append(resp.content);
          $('#flash').show();
          $('#flash').html("<div id='notice'>"+response.message+"</div>");
        }       
	AjaxUploadHandler.setFormVisibility();
      }, 'json');
    } else {
      $('#flash').show();
      $('#flash').html("<div id='error'>"+response.message+"</div>");
    }

    return false;
  },

  ajaxUploadForm: function(){
    return $('#ajaxUploadForm');
  }, 

  ajaxUploadNotificationBox: function(){
    return $('#ajax_upload_notification_box');
  },

  setFormVisibility: function() {
    var acceptable_assets_quantity = $('#upload_button').attr('rel');
    if($('ul#assets').children().length < acceptable_assets_quantity) {
       AjaxUploadHandler.ajaxUploadForm().show();
    }
    else {
      AjaxUploadHandler.ajaxUploadForm().hide();
    }
  }

});

jQuery(document).ready(function() {
  new AjaxUploadHandler();
});