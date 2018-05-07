document.addEventListener("turbolinks:load", function(){
  $input = $("#search");
  var options = {
    getValue: "name",
    url: function(phrase){
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "products",
        header: "<strong>--Products--</strong>"
       },
      {
        listLocation: "brands",
        header: "<strong>--Brands--</strong>",
      },
      {
        listLocation: "categories",
        header: "<strong>--Categories--</strong>",
      },
    ],
    list: {
      onChooseEvent: function(){
        var url = $input.getSelectedItemData().url
        window.location.href = url
      }
    }
  }
  $input.easyAutocomplete(options)
});
