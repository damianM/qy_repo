var swfu;
jQuery(document).ready(function() {  

    swfu = new SWFUpload({
	    // Backend settings
	    upload_url: "/videos/create",
	    file_post_name: "uploaded_data",

	    // Flash file settings
	    file_size_limit : "100 MB",
	    file_types : "*.avi;*.mpg;*.MPG;*.AVI",// or you could use something like: "*.doc;*.wpd;*.pdf",
	    file_types_description : "All Files",
	    file_upload_limit : "0",
	    file_queue_limit : "1",

	    // Event handler settings
	    swfupload_loaded_handler : swfUploadLoaded,
	    
	    file_dialog_start_handler: fileDialogStart,
	    file_queued_handler : fileQueued,
	    file_queue_error_handler : fileQueueError,
	    file_dialog_complete_handler : fileDialogComplete,
	    
	    //upload_start_handler : uploadStart,// I could do some client/JavaScript validation here, but I don't need to.
	    upload_progress_handler : uploadProgress,
	    upload_error_handler : uploadError,
	    upload_success_handler : uploadSuccess,
	    upload_complete_handler : uploadComplete,

	    // Button Settings
	    button_image_url : "/swfupload/XPButtonUploadText_61x22.png",
	    button_placeholder_id : "spanButtonPlaceholder",
	    button_width: 61,
	    button_height: 22,
	    
	    // Flash Settings
	    flash_url : "/swfupload/swfupload.swf",

	    custom_settings : {
		progress_target : "fsUploadProgress",
		upload_successful : false
	    },
	    
	    // Debug settings
	    debug: false
	});


});