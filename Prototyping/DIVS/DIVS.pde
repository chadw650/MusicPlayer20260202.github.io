void settings() {
  fullScreen(1);
  size(displayWidth, displayHeight);
}

void setup() {
  // Left side
  
  // Main Container
  float MainContainerXPos = displayWidth * 5/1920;
  float MainContainerYPos = displayHeight * 5/1080;
  
  float MainContainerXSize = displayWidth * 300/1920;
  float MainContainerYSize = displayHeight * 500/1080;
  
  rect(MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize, 3);
  
  // Playlist Container
  float PlaylistContainerXPos = displayWidth * 5/1920;
  float PlaylistContainerYPos = displayHeight * 510/1080;
  
  float PlaylistContainerXSize = displayWidth * 300/1920;
  float PlaylistContainerYSize = displayHeight * 565/1080;
  
  rect(PlaylistContainerXPos, PlaylistContainerYPos, PlaylistContainerXSize, PlaylistContainerYSize, 3);
  
  // Middle
  
  // Music Container
  float MusicContainerXPos = displayWidth * 310/1920;
  float MusicContainerYPos = displayHeight * 5/1080;
  
  float MusicContainerXSize = displayWidth * 1300/1920;
  float MusicContainerYSize = displayHeight * 600/1080;
  
  rect(MusicContainerXPos, MusicContainerYPos, MusicContainerXSize, MusicContainerYSize,3);
}

void draw() {

}
