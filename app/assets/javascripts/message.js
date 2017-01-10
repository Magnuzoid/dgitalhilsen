
//var canvas = window._canvas = new fabric.Canvas('c');
var canvas;

$(document).ready(function(){
  initialize();
});

function initialize() {
  canvas = new fabric.Canvas('canvas');
  var rectButton = document.getElementById("create-rect");
  var submitBtn = $(".message-submit");

  $(".shape-button").on('click', function(e){
    e.preventDefault;
    var clickedButton = $(e.target);

    switch(clickedButton.attr("id")) {
      case "create-rect":
      console.log("Firkant");
        var rect = new fabric.Rect({
            top : 100,
            left : 100,
            width : 60,
            height : 70,
            fill : 'red'
        });
        canvas.add(rect);
        break;

      case "create-oval":
        console.log("Oval");
        var circle = new fabric.Circle({
              radius: 20,
              fill: 'green',
              left: 100,
              top: 100
        });
        canvas.add(circle);
        break;

      case "create-tri":
        console.log("triangle");
        var triangle = new fabric.Triangle({
                            width: 20,
                            height: 30,
                            fill: 'blue',
                            left: 50,
                            top: 50
        });
        canvas.add(triangle);
        break;
      default:
        break;
      }
  });

  submitBtn.on('click', function(e){
    //e.preventDefault();
    var hejsa = JSON.stringify(canvas);
    //console.log(hejsa);
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


function initCanvas(){
  console.log("init canvas");
  j = $("#json.value").text();
  json = JSON.parse(j);
  //console.log(json);
  //canvas.deactivateAll();
  //var jarl = JSON.stringify(j);
  //console.log(j);

  canvas.loadFromJSON(json, canvas.renderAll.bind(canvas));
  canvas.renderAll;
  //console.log(canvas);
  //console.log(JSON.stringify(canvas.toDatalessJSON()));
  //console.log(canvas);
  //console.log(test);
  //canvas.loadFromJSON());
}
