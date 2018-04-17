$(document).ready(function() {
  $('#livesearch_input').hsearchbox({
    url: $('#livesearch_form').attr('action'),
    param: 'search',
    dom_id: '#livesearch_dom',
    loading_css: '#livesearch_loading',
    onInitSearch: function() {
      console.log("search init:" + this.url);
    },
    onStartSearch: function() {
      console.log("search start");
    },
    onFinishSearch: function() {
      console.log("search finish");
    }
  });
  $('#livesearch_product_input').hsearchbox({
    url: $('#livesearch_prodcut_form').attr('action'),
    param: 'search',
    dom_id: '#livesearch_product_dom',
    loading_css: '#livesearch_product_loading',
    onInitSearch: function() {
      console.log("user init:" + this.url);
    },
    onStartSearch: function() {
      console.log("user start");
    },
    onFinishSearch: function() {
      console.log("user finish");
    }
  });
});
