var JcUploadControl = $.inherit({
  __constructor : function() {

    this.jcUpload = null;

    $('#jcUploadForm').livequery($.delegate(this, this.initJcUpload));            

  },

  initJcUpload: function(src) {
    var settings = {
      url: "/videos/create",
      box_height: 160,
      callback: {
        error_file_size: JcUploadControl.errorFileSize,
        error_queue_count: JcUploadControl.errorQueueCount,
        error_queue_size: JcUploadControl.errorQueueSize,
        queue_upload_end: JcUploadControl.queueUploadEnd,
        upload_end: JcUploadControl.uploadEnd
      }
    };   
    
    src = $(src);

    var video_gallery_id = $('#video_gallery_id').val();

    settings.url = "/videos/create" + '?video[gallery_id]='+video_gallery_id;
   
    this.jcUpload = $.jcuploadUI(settings);
    this.jcUpload.append_to("#jcupload_content");
  }

}, {

  errorFileSize: function(uo, file_name, file_type, file_size) {
    alert("File " +file_name +" is to big!");
  },

  errorQueueCount: function(uo, file_name, file_type, file_size) {
    alert("File " +file_name +" ignored, because the file queue is full!");
  },

  errorQueueSize: function(uo, file_name, file_type, file_size) {
    alert("File " +file_name +" ignored, becouse the file queue size is too big!");
  },

  queueUploadEnd: function(uo){
    var video_title = $('#video_title').val();
    var video_description = $('#video_title').val();

    $.get('/videos/update_video', {title: video_title, description: video_description}, function(response){
      if (response.success){
        window.location.href = window.location.href;
      }
    }, "json");

    if (video_title == ''){
      $('#title_errors').html("<div class='formError'>Proszę o podanie tytułu.</div>");
      $('table.jcu_file_table tbody').children('tr:last').remove();
    }
  }


});


