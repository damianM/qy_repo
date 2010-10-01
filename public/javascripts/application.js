var Application = $.inherit({
  __constructor : function() {

    $("#table_with_pagination ul.dictionary_items li").livequery("click", $.delegate(this, this.onFilterByDictionaryItem));

  },
  
  onFilterByDictionaryItem: function(src) {
    $(src).children('input').attr('checked', 'checked');
    var dictionary_item_id = $(src).children('input').val();
    var dictionary_id = $(src).parents('ul.dictionary_items').attr('id').match(/\d+/);

    $.post($(src).attr('rel'), {_method:"GET", dictionary_item_id:dictionary_item_id, dictionary_id:dictionary_id}, this.onSuccessFilterByDictionaryItem);
    return false;
  },

  onSuccessFilterByDictionaryItem: function(response) {
    $("#table_with_pagination").html(response);
    Application.reloadBanners();
    return false;
  }

}, {

  reloadBanners: function() {
    var dictionary_item_id = $("ul.dictionary_items li input[type=radio]:checked").attr('id').match(/\d+/);
    $.post('/banners/content_for/', { dictionary_item_id:dictionary_item_id }, Application.onSuccessReloadBanners, 'json');
  }, 

  onSuccessReloadBanners: function(response) {
    if(response.success) {
      $("#header #banner-top").html(response.banner_top);
      $("#right #banner-right").html(response.banner_right);
    }
    return false;
  },

  validate: function(src, obj) {
    $(src).validate(obj);
  }

});

jQuery(document).ready(function() {
  new Application();
});