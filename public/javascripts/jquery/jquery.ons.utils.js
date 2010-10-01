// setup ajax
jQuery.ajaxSetup({
  beforeSend: function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");},
  data: {authenticity_token: AUTH_TOKEN}
});

jQuery.fn.ajaxLoader = function(text) {
  return this.html('<p class="ajax-loader"><img src="/images/spinner.gif" /><span>' + (text || '') + '</span></p>');
};

// fix for a IE7 bug, see http://jamazon.co.uk/web/2008/03/17/thickbox-31-ie7-positioning-bug/
jQuery.browser.msie6 = jQuery.browser.msie && /MSIE 6\.0/i.test(window.navigator.userAgent) && !/MSIE 7\.0/i.test(window.navigator.userAgent);



