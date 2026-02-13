void settings() {
  fullScreen(1);
  size(displayWidth,displayHeight);
}

void setup() {
  // Left side
  
  // Main Container
  float MainContainerXPos = displayWidth * 5/1920;
  float MainContainerYPos = displayHeight * 5/1080;
  
  float MainContainerXSize = displayWidth * 300/1920;
  float MainContainerYSize = displayHeight * 500/1080;
  
  rect(MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize, 3);
}

void draw() {

}
