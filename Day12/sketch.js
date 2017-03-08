var spot = {
  x: 130,
  y: 50
}

var col = {
  r: 0,
  g: 0,
  b: 0;
}
function setup() {
  createCanvas(1400, 1100);
  background(0);
}

function draw() {
  col.r = random(25, 300);
  col.g = random(1, 400);
  col.b = random(100, 190);
  
  spot.x = random(100, width);
  spot.y = random(3, height);
  noStroke();
  fill(col.r, col.g, col.b, 340);
  ellipse(spot.x, spot.y, 7, 50);
}