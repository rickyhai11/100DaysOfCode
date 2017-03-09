var img;  // Declare variable 'img'.

function setup() {
  createCanvas(1900, 1900); 
  img = createImage(40, 40);
  img.loadPixels();
  for(var x = 0; x < img.width; x++) {
    for(var y = 0; y < img.height; y++) {
      var a = map(y, 0, img.height, 255, 0);
      img.set(x, y, [0, 153, 204, a]); 
    }
  }
  img.updatePixels();
}

function draw() {
  background(8983);
  image(img, 700, 740);
  image(img, mouseX-img.width/2, mouseY-img.height/2);
}