$(".upload-image").on("change", function(){
  var files = event.target.files;
  var output = document.getElementById("preview");

  for(var i = 0; i< files.length; i++)
  {
    var file = files[i];
    console.log(file);
    if(!file.type.match('image'))
        continue;
    var picReader = new FileReader();
    picReader.addEventListener("load",function(event){

      var picFile = event.target;
      console.log(picFile);
      var span = document.createElement("span");
      span.innerHTML = ['<img class="thumb" src="', picFile.result,
        '" title="', picFile.name,
        '"/><span class="remove_img_preview"></span>'].join('');
      output.insertBefore(span, null);
      span.children[1].addEventListener("click", function(event){
          span.parentNode.removeChild(span);
      });
    });
    picReader.readAsDataURL(file);
  }

});
