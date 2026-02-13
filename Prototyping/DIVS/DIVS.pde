/* 
DIVS 2D Rectangles
*/

println(displayWidth, displayHeight);

fullScreen();
size(displayWidth, displayHeight);

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
  float MusicContainerYSize = displayHeight * 900/1080;
  
  rect(MusicContainerXPos, MusicContainerYPos, MusicContainerXSize, MusicContainerYSize,3);
  
  // Progress Bar
  float ProgressBarXPos = displayWidth * 310/1920;
  float ProgressBarYPos = displayHeight * 910/1080;
  
  float ProgressBarXSize = displayWidth * 1300/1920;
  float ProgressBarYSize = displayHeight * 25/1080;
  
  rect(ProgressBarXPos,ProgressBarYPos,ProgressBarXSize,ProgressBarYSize, 3);
  
  // Right Side
  
  // Lyrics Container
  float LyricsContainerXPos = displayWidth * 1615/1920;
  float LyricsContainerYPos = displayHeight * 5/1080;
  
  float LyricsContainerXSize = displayWidth * 300/1920;
  float LyricsContainerYSize = displayHeight * 930/1080;
  
  rect(LyricsContainerXPos, LyricsContainerYPos, LyricsContainerXSize, LyricsContainerYSize, 3);
  
  
  // Main Player
  
  // Music Player Container
  float MPContainerXPos = displayWidth * 310/1920;
  float MPContainerYPos = displayHeight * 940/1080;
  
  float MPContainerXSize = displayWidth * 1605/1920;
  float MPContainerYSize = displayHeight * 135/1080;
  
  rect(MPContainerXPos,MPContainerYPos,MPContainerXSize,MPContainerYSize,3);
