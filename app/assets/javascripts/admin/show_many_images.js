//  var imageList = [];
//  var output = document.getElementById("preview");
// $(".upload-image").on("change", function(){

//   var files = event.target.files;
//   imageList = [];
//   for(var i = 0; i< files.length; i++)
//   {
//     var file = files[i];
//     if(!file.type.match('image'))
//     continue;
//     imageList.push(file);
//   }
//   renderImageList();
// });
// renderImageList = function(){
//   imageList.forEach(function(file, index){
//      console.log(file);
//     var imageurl = file["name"];
//     console.log(imageurl);
//     var span = document.createElement("span");
//     span.innerHTML = ['<img class="thumb" src="',
//       imageurl,
//       '" title="', file.name,
//       '"/><span class="remove_img_preview"></span>'].join('');
//     output.appendChild(span);
//     span.children[1].addEventListener("click", function(event){
//         span.parentNode.removeChild(span);
//         // delete imageList[index];
//         imageList.splice(index, 1);
//         // console.log(imageList);
//         imageList = imageList;
//         // console.log("so "+imageList)
//     });
//   });
// };

// $('#product-modal').on('shown.bs.modal', function(){

//   $("body").on("click", '#btnsubmit', function(evnt){
//     evnt.preventDefault();

//     imageList.forEach(function (file) {

//       $.ajax({
//         url: "/admin/products",
//         type: "POST",
//         data: file.name,
//         // success: function (data) {
//         // }
//      });

//     });

//   });

// });

$(".upload-image").on("change", function(){
  var files = event.target.files;
  var output = document.getElementById("preview");
  var newFileList = Array.from(files);

  for(var i = 0; i< newFileList.length; i++)
  {
    var file = newFileList[i];
    if(!file.type.match('image'))
        continue;
    var picReader = new FileReader();
    picReader.addEventListener("load",function(event){
      var picFile = event.target;
      //console.log(picFile);
      console.log(picFile);
      var span = document.createElement("span");
      span.innerHTML = ['<img class="thumb" src="', picFile.result,
        '" title="', picFile.name,
        '"/><span class="remove_img_preview"></span>'].join('');
      output.insertBefore(span, null);
      span.children[1].addEventListener("click", function(event){
          newFileList.splice(i-1, 1);
          span.parentNode.removeChild(span);
          newFileList = newFileList
      });
    });
    newFileList = newFileList
    picReader.readAsDataURL(file);
  }
  //console.log(newFileList);
});
