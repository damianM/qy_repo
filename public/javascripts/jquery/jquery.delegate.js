jQuery.Delegate = $.inherit({
    __constructor: function(object, method,args) {
      this.object = object;
      this.method = method;
      this.args = args;
    },
    callback: function(src, args) {         
      return this.method.apply(this.object, [src].concat(this.args).concat(args));
    }
  }, {
    getArgs: function(v, idx) {
      var args = new Array();
      var n = v.length;
      
      for (var i = idx; i < n; i++) {
        args.push(v[i]);
      }
      
      return args;
    },
    
    create : function(object, method) {
      var delegate = new jQuery.Delegate(object, method, jQuery.Delegate.getArgs(arguments, 2));

      return function() {                
        return delegate.callback(this, jQuery.Delegate.getArgs(arguments, 0));
      };
    }
  }
);

jQuery.delegate = jQuery.Delegate.create;
