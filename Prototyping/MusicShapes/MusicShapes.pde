PImage img;

void setup() {
  size(1000,1000);
  img = loadImage("https://s.imgur.com/images/logo-1200-630.png", "png");
}

void draw() {
  if (img != null) {
    image(img, 200,200, 500, 300);
  }
}
