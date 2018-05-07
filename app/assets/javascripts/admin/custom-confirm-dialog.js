$(document).on('mousedown','button[data-confirm]',function(e){
  e.preventDefault();
  element = this;
  link = $(e.target);
  message = link.data('confirm');
  swal(message, {buttons: ["No , please don't !", "Yes of course"],
   icon: "warning"}).then(function(val){
    if(val == true)
    {
      element.removeAttribute("data-confirm");
      element.click();
    }
  });
});
