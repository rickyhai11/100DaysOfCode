var inc = .1;
var scl = 6;
var cols, rows;

function setup() {
  createCanvas(500, 500);
  cols = floor(width/scl)
  rows = floor(height/scl)
}

function draw() {
  var yoff = 0;
 
  for (var y = 0; y < rows; y++) {
    var xoff = 0;
    for (var x = 0; x < cols; x++) {
      var index = (x + y * width) * 4;
      var r = noise(xoff, yoff) * 255;
	  var v = p5.Vector.fromAngle(random(0,2 * PI));
      xoff += inc;
	  
	  //fill(r)
	  
	 stroke(0);
	 push();
	 translate(x * scl, y * scl);
	 rotate(v.heading());
	 line(0,0,scl,0);
	 pop();
	  //rect(x * scl, y * scl, scl, scl)
    }
    yoff += inc;
  }

}