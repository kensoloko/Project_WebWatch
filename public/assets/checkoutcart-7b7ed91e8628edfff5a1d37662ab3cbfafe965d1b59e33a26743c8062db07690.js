simpleCart({
  checkout: {
    type: "SendForm",
    url: "/checkout",
    method: "GET"
  },
  load: function(){
    $(".simpleCart_input").change(function(){
      console.log("abc");
      if(this.val() <= 0) this.val(1)
      if(this.val() == 1) $("this:parent > .btn").hide()
    });
    if(simpleCart.quantity() == 0)
    {
      $(".simpleCart_checkout").hide();
    }
  },
  update: function(){
    if(simpleCart.quantity() == 0)
    {
      $(".simpleCart_checkout").hide();
    }
  },
  beforeRemove: function(item){
    if(item.quantity() <= 0)
      item.quantity(1);
    return!1
  }
});
simpleCart.bind("beforeCheckout", function(data){
  simpleCart.empty();
});

$(document).on("keyup","input[type='number']",function(e){
  var key = e.which || e.keyCode;
  var element = this;
  if((key >= 96 && key <= 105)||(key >= 48 && key <= 57))
  {
    if(element.value <= 0)
    {
      element.value = 1;
      swal("Are you sure you want to remove product?",
        {buttons: ["No!", "Yes!"],icon:"info"})
      .then(function(val){
        if(val == true)
          $(".simpleCart_remove").click();
        else
          element.value = 1
      })
    }
  }
});

$(document).on("mousedown","a.simpleCart_remove",function(e){
  e.preventDefault();
  var element = this;
  swal("Are you sure you want to remove product?",
    {buttons: ["No!", "Yes!"],icon:"info"})
  .then(function(val){
    if(val == true)
      $(".simpleCart_remove").click();
  })
});

var app = new Vue({
  el: "#app",
  data: {
    cart: JSON.parse(window.localStorage.simpleCart_items)
  },
  computed: {
    items: function(){
      var array = Object.keys(this.cart);
      var arr = [];
      for(var i = 0; i < array.length; i++)
      {
        arr.push(this.cart[array[i]]);
      }
      return arr;
    },
    items_count: function(){
      return Object.keys(this.cart).length
    }
  },
  methods: {
    load: function(){
      var value = JSON.stringify(this.cart);
      if(value == "{}")
      {
        simpleCart.empty();
      }
      else
      {
        window.localStorage.setItem("simpleCart_items",value);
        simpleCart.load();
      }
    },
    increment: function(p){
      if(p.quantity < 10)
      {
        p.quantity += 1;
        this.load();
      }
      else
        swal("info","Sorry, you can only purchase certain products","info");
    },
    decrement: function(p){
      if(p.quantity > 1)
      {
        p.quantity -= 1;
        this.load();
      }
      else
        swal("info","Sorry, product number should be greater than 0","info");
    },
    quantity: function(p){
      if(p.quantity <= 0)
      {
        p.quantity = 1;
        swal("info","Sorry, product number should be greater than 0","info");
      }
      else if (p.quantity > 10){
        p.quantity = 10;
        swal("info","Sorry, you can only purchase certain products","info");
      }
      else
        this.load();
    },
    remove: function(p){
      var element = this;
      swal({
        titel:"warning",
        text:"Are you sure you want to remove product?",
        icon:"warning",
        buttons: {
          cancel: "Oh no!",
          confirm: "OK"
        }
      })
      .then(function(value){
        if(value === true)
        {
          delete element.cart[p.id];
          element.load();
          element.cart = JSON.parse(window.localStorage.simpleCart_items);
        }
      });
    }
  }
});

