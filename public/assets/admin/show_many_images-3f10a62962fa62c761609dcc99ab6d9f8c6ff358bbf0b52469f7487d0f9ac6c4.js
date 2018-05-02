$(".upload-image").on("change", function(){
var preview = document.querySelector("#preview");
var files   = document.querySelector("input[type=file]").files;

function readAndPreview(file) {

  if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
    var reader = new FileReader();
    var output = document.getElementById("preview");
    reader.addEventListener("load", function () {
      var image = new Image();
      image.height = 50;
      image.width = 50;
      image.title = file.name;
      image.src = this.result;

      var span = document.createElement("span");
      span.innerHTML = ['<img class="thumb" src="', image.src, '" title="',
        image.title, '"/><span class="remove_img_preview"></span>'].join('');
      output.insertBefore(span,null);
      span.children[1].addEventListener("click", function(event){
        span.parentNode.removeChild(span);
        $('#file').val('');
      });

    }, false);
    reader.readAsDataURL(file);
  }
}

if (files) {
  [].forEach.call(files, readAndPreview);
}
})
;
