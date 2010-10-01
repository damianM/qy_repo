var FlashMessage = $.inherit({
  __constructor : function(node_) {
    this.node = node_;
  },
  
  showByType: function (type_, text_) {
    var typeElement = this.node.find('.flash .' + type_);
   
    if (typeElement.size() == 0) {
      typeElement = $('<div class="flash ' + type_ + '"><p></p></div>');
      this.node.html(typeElement);
    }
    typeElement.find("p").html(text_);
  },
  
  show: function (success_, text_, dontClear_) {
    var type = success_ ? 'notice' : 'error';
    if (!dontClear_) {
      this.clear(success_ ? 'error' : 'notice');
    }
    this.showByType(type, text_);
  },
  
  clear: function(type_) {
    this.node.find('.flash.' + type_).remove();
  }
}, {
  response: function(response) {
    window.flashMessage.show(response.success, response.message);
  }
});

jQuery(document).ready(function() {
  window.flashMessage = new FlashMessage($('#flash'));
});
