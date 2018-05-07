document.addEventListener("turbolinks:load", function(){
  $input = $("[data-behavior='autocomplete']");
  var options = {
    getValue: "name",
    url: function(phrase){
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "products",
        header: "<strong>Products</strong>"
       }
      // {
      //   listLocation: "brands",
      //   header: "<strong>Brands</strong>",
      // }
    ],
    list: {
      onChooseEvent: function(){
        var url = $input.getSelectedItemData().url
        console.log(url)
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }
  $input.easyAutocomplete(options)

});
