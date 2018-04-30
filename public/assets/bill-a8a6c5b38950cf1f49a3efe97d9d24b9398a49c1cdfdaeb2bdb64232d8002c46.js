$("#select_status, #select_times").on("change",function(){
  var ele = $("#select_status");
  var time = $("#select_times");
  console.log("status" + ele.val() + "time" + time.val());
  $.ajax({
    method: "GET",
    url: document.URL + ".js",
    data: {"status": ele.val(), "time": time.val()},
    error: function(xhr){
      alert("An error occured: " + xhr.status + " " + xhr.statusText);
    }
  })
});

