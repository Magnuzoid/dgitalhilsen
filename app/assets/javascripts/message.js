
//var canvas = window._canvas = new fabric.Canvas('c');
var canvas;

$(document).ready(function(){

  if (document.getElementById("canvas")) {
    canvas = new fabric.Canvas('canvas');
  }

  initialize();
});

function initialize() {
  var rectButton = document.getElementById("create-rect");
  var submitBtn = $(".message-submit");

  autoSearch();

  submitBtn.on('click', function(e){
    e.preventDefault();
    var hejsa = JSON.stringify(canvas);
    //console.log("event stoppet");
    $("#message_msg").val(hejsa);
    $("#new_message").submit();
  });
}



function lockAllElements() {
  console.log("lockAllElements()");
  canvas.hoverCursor = 'default'
  var objs = canvas.getObjects().map(function(o) {
  return o.set('selectable', false);


});
}

function autoSearch() {

  var searchField = $("#search");

  searchField.on("change keyup paste", function(e){
    var valueChecker = searchField.val().length;

    if (valueChecker >= 3){
      $("#lookup-form").submit();
    }

  });

  var searchButton = $("#search-form input[type=submit]").addClass("hide");

}

function initCanvas(){
  console.log("init canvas");
  j = $("#json.value").text();
  json = JSON.parse(j);
  canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  canvas.renderAll;
}

$(function(){
  $("#")
});
