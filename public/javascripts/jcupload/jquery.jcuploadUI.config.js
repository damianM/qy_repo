(function($){
  $.fn=$.fn||{};$.jcuploadUI_config={
	flash_file:"/javascripts/jcupload/jcupload.swf",
	flash_width:100,
	flash_height:22,
	flash_background:"/stylesheets/gfx/jcu_button.png",
	flash_background_offset_x:0,
	flash_background_offset_y:0,
	box_height:400,
	file_icon_ready:'/stylesheets/gfx/jcu_file_ready.gif',
	file_icon_uploading:'/stylesheets/gfx/jcu_file_uploading.gif',
	file_icon_finished:'/stylesheets/gfx/jcu_file_finished.gif',
	file_icon_error:'/stylesheets/gfx/jcu_file_error.gif',
	hide_file_after_finish:false,
	hide_file_after_finish_timeout:100,
	error_timeout:30000,
	max_file_size:100*1024*1024,
	max_queue_count:100,
	max_queue_size:0,
	extensions:["Wybierz rozszerzenie (*.*)|*.*;"],
	multi_file:0,
	callback:{
		init:false,
		pre_dialog:false,
		file_added:false,
		upload_start:false,
		upload_progress:false,
		upload_end:false,
		queue_upload_end:false,
		error_file_size:false,
		error_queue_count:false,
		error_queue_size:false}
        }
})($);