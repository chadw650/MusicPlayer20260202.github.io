/* 
DIVS 2D Rectangles

:))

*/

println(displayWidth, displayHeight);

fullScreen();

int AppWidth = displayWidth;
int AppHeight = displayHeight;

size(displayWidth, displayHeight);

// Left side
  
  // Main Container
  float MainContainerXPos = AppWidth * 5/1920;
  float MainContainerYPos = AppHeight * 5/1080;
  
  float MainContainerXSize = AppWidth * 300/1920;
  float MainContainerYSize = AppHeight * 500/1080;
  
  rect(MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize, 3);
  
  // Playlist Container
  float PlaylistContainerXPos = AppWidth * 5/1920;
  float PlaylistContainerYPos = AppHeight * 510/1080;
  
  float PlaylistContainerXSize = AppWidth * 300/1920;
  float PlaylistContainerYSize = AppHeight * 565/1080;
  
  rect(PlaylistContainerXPos, PlaylistContainerYPos, PlaylistContainerXSize, PlaylistContainerYSize, 3);
  
  // Middle
  
  // Music Container
  float MusicContainerXPos = AppWidth * 310/1920;
  float MusicContainerYPos = AppHeight * 5/1080;
  
  float MusicContainerXSize = AppWidth * 1300/1920;
  float MusicContainerYSize = AppHeight * 900/1080;
  
  rect(MusicContainerXPos, MusicContainerYPos, MusicContainerXSize, MusicContainerYSize,3);
  
  // Progress Bar
  float ProgressBarXPos = AppWidth * 310/1920;
  float ProgressBarYPos = AppHeight * 910/1080;
  
  float ProgressBarXSize = AppWidth * 1300/1920;
  float ProgressBarYSize = AppHeight * 25/1080;
  
  rect(ProgressBarXPos,ProgressBarYPos,ProgressBarXSize,ProgressBarYSize, 3);
  
  // Right Side
  
  // Lyrics Container
  float LyricsContainerXPos = AppWidth * 1615/1920;
  float LyricsContainerYPos = AppHeight * 5/1080;
  
  float LyricsContainerXSize = AppWidth * 300/1920;
  float LyricsContainerYSize = AppHeight * 930/1080;
  
  rect(LyricsContainerXPos, LyricsContainerYPos, LyricsContainerXSize, LyricsContainerYSize, 3);
  
  
  // Main Player
  
  // Music Player Container
  float MPContainerXPos = AppWidth * 310/1920;
  float MPContainerYPos = AppHeight * 940/1080;
  
  float MPContainerXSize = AppWidth * 1605/1920;
  float MPContainerYSize = AppHeight * 135/1080;
  
  rect(MPContainerXPos,MPContainerYPos,MPContainerXSize,MPContainerYSize,3);
    
    // Music Player Buttons
    for (int i = 0; i <= 10; i++) {
      float ButtonWidth = AppWidth * 110/1920;
      float ButtonHeight = AppHeight * 110/1080;
      
      float Padding = 10;
      
      float ButtonXPos = AppWidth * (320 + (i * (ButtonWidth + Padding)))/1920;
      float ButtonYPos = AppHeight * 955 / 1080;
      
      rect(ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight,3);
    }
    
    
