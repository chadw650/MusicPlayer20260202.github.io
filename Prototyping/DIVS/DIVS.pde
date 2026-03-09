/*
 DIVS 2D Rectangles
 
 :))
 
 */
int AppWidth, AppHeight;

float GUIWidth = 1920;
float GUIHeight = 1080;

PImage FastForwardButtonImg;
PImage FasterForwardButtonImg;
PImage PreviousButtonImg;
PImage PlayButtonImg;
PImage PauseButtonImg;
PImage StopButtonImg;
PImage SkipButtonImg;
PImage MuteButtonImg;
PImage VolumeDownImg;
PImage VolumeUpImg;

void setup() {
  fullScreen();
  
  AppWidth = displayWidth;
  AppHeight = displayHeight;
  
  // Load Images
  FastForwardButtonImg = loadImage("FastForward.png");
  FasterForwardButtonImg = loadImage("FasterForward.png");
  PreviousButtonImg = loadImage("PreviousSong.png");
  PlayButtonImg = loadImage("Playbutton.png");
  PauseButtonImg = loadImage("PauseButton.png");
  StopButtonImg = loadImage("StopButton.png");
  SkipButtonImg = loadImage("SkipSong.png");
  MuteButtonImg = loadImage("MuteSong.png");
  VolumeDownImg = loadImage("LowerVolume.png");
  VolumeUpImg = loadImage("VolumeUp.png");
}

void draw() {
  background(255);
    
  fill(255);
  stroke(0);
  strokeWeight(1);
    
  boolean HoveringOverButton = false;
    
   // Left side
  
  // Main Container
  float MainContainerXPos = AppWidth * 5/GUIWidth;
  float MainContainerYPos = AppHeight * 5/GUIHeight;
  
  float MainContainerXSize = AppWidth * 300/GUIWidth;
  float MainContainerYSize = AppHeight * 500/GUIHeight;
  
  rect(MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize, 3);
  
  // Home Button
  float HomeButtonXPos = AppWidth * 10/GUIWidth;
  float HomeButtonYPos = AppHeight * 10/GUIHeight;
  
  float HomeButtonXSize = AppWidth * 290/GUIWidth;
  float HomeButtonYSize = AppHeight * 35/GUIHeight;
  
  rect(HomeButtonXPos, HomeButtonYPos, HomeButtonXSize, HomeButtonYSize, 3);
  
  // Playlist Container
  float PlaylistContainerXPos = AppWidth * 5/GUIWidth;
  float PlaylistContainerYPos = AppHeight * 510/GUIHeight;
  
  float PlaylistContainerXSize = AppWidth * 300/GUIWidth;
  float PlaylistContainerYSize = AppHeight * 565/GUIHeight;
  
  rect(PlaylistContainerXPos, PlaylistContainerYPos, PlaylistContainerXSize, PlaylistContainerYSize, 3);
  
  // Middle
  
  // Music Container
  float MusicContainerXPos = AppWidth * 310/GUIWidth;
  float MusicContainerYPos = AppHeight * 5/GUIHeight;
  
  float MusicContainerXSize = AppWidth * 1300/GUIWidth;
  float MusicContainerYSize = AppHeight * 900/GUIHeight;
  
  rect(MusicContainerXPos, MusicContainerYPos, MusicContainerXSize, MusicContainerYSize, 3);
  
  // Current Song
  float CurrentSongXPos = AppWidth * 320/GUIWidth;
  float CurrentSongYPos = AppHeight * 50/GUIHeight;
  
  float CurrentSongXSize = AppWidth * 1280/GUIWidth;
  float CurrentSongYSize = AppHeight * 600/GUIHeight;
  
  rect(CurrentSongXPos, CurrentSongYPos, CurrentSongXSize, CurrentSongYSize, 3);
  
  // Current song Text
  float CurrentSongTextXPos = AppWidth * 325/GUIWidth;
  float CurrentSongTextYPos = AppHeight * 55/GUIHeight;
  
  float CurrentSongTextXSize = AppWidth * 200/GUIWidth;
  float CurrentSongTextYSize = AppHeight * 35/GUIHeight;
  
  rect(CurrentSongTextXPos, CurrentSongTextYPos, CurrentSongTextXSize, CurrentSongTextYSize, 3);
  
  // NowPlayingText
  float NowPlayingTextXPos = AppWidth * 320 / GUIWidth;
  float NowPlayingTextYPos = AppHeight * 10 / GUIHeight;
  
  float NowPlayingTextXSize = AppWidth * 300 / GUIWidth;
  float NowPlayingTextYSize = AppHeight * 35 / GUIHeight;
  
  rect(NowPlayingTextXPos, NowPlayingTextYPos, NowPlayingTextXSize, NowPlayingTextYSize, 3);
  
  // Next Song 1
  float NextSong1XPos = AppWidth * 320/GUIWidth;
  float NextSong1YPos = AppHeight * 650/GUIHeight;
  
  float NextSong1XSize = AppWidth * 1280/GUIWidth;
  float NextSong1YSize = AppHeight * 80/GUIHeight;
  
  rect(NextSong1XPos, NextSong1YPos, NextSong1XSize, NextSong1YSize, 3);
  
  // Next Song 2
  float NextSong2XPos = AppWidth * 320/GUIWidth;
  float NextSong2YPos = AppHeight * 730/GUIHeight;
  
  float NextSong2XSize = AppWidth * 1280/GUIWidth;
  float NextSong2YSize = AppHeight * 80/GUIHeight;
  
  rect(NextSong2XPos, NextSong2YPos, NextSong2XSize, NextSong2YSize, 3);
  
  // Next Song 3
  float NextSong3XPos = AppWidth * 320/GUIWidth;
  float NextSong3YPos = AppHeight * 810/GUIHeight;
  
  float NextSong3XSize = AppWidth * 1280/GUIWidth;
  float NextSong3YSize = AppHeight * 80/GUIHeight;
  
  rect(NextSong3XPos, NextSong3YPos, NextSong3XSize, NextSong3YSize, 3);
  
  // Progress Bar
  float ProgressBarXPos = AppWidth * 310/GUIWidth;
  float ProgressBarYPos = AppHeight * 910/GUIHeight;
  
  float ProgressBarXSize = AppWidth * 1300/GUIWidth;
  float ProgressBarYSize = AppHeight * 25/GUIHeight;
  
  rect(ProgressBarXPos, ProgressBarYPos, ProgressBarXSize, ProgressBarYSize, 3);
  
  // Right Side
  
  // Lyrics Container
  float LyricsContainerXPos = AppWidth * 1615/GUIWidth;
  float LyricsContainerYPos = AppHeight * 5/GUIHeight;
  
  float LyricsContainerXSize = AppWidth * 300/GUIWidth;
  float LyricsContainerYSize = AppHeight * 930/GUIHeight;
  
  rect(LyricsContainerXPos, LyricsContainerYPos, LyricsContainerXSize, LyricsContainerYSize, 3);
  
  // Lyrics Title
  float LyricsTitleXPos = AppWidth * 1620/GUIWidth;
  float LyricsTitleYPos = AppHeight * 10/GUIHeight;
  
  float LyricsTitleXSize = AppWidth * 290/GUIWidth;
  float LyricsTitleYSize = AppHeight * 35/GUIHeight;
  
  rect(LyricsTitleXPos, LyricsTitleYPos, LyricsTitleXSize, LyricsTitleYSize, 3);
  
  // Lyrics
  float LyricsXPos = AppWidth * 1620/GUIWidth;
  float LyricsYPos = AppHeight * 50/GUIHeight;
  
  float LyricsXSize = AppWidth * 290/GUIWidth;
  float LyricsYSize = AppHeight * 880/GUIHeight;
  
  rect(LyricsXPos, LyricsYPos, LyricsXSize, LyricsYSize, 3);
  
  
  // Main Player
  
  // Music Player Container
  float MPContainerXPos = AppWidth * 310/GUIWidth;
  float MPContainerYPos = AppHeight * 940/GUIHeight;
  
  float MPContainerXSize = AppWidth * 1605/GUIWidth;
  float MPContainerYSize = AppHeight * 135/GUIHeight;
  
  rect(MPContainerXPos, MPContainerYPos, MPContainerXSize, MPContainerYSize, 3);
  
  String[] Buttons = {
   "FastForward", // 1
   "FasterForward", // 2
   "UnmuteSong", // 3
   "GoBackSong", // 4
   "Pause", // 5
   "Play", // 6
   "Stop", // 7
   "SkipSong", // 8
   "MuteSong", // 9
   "VolumeDown", // 10
   "VolumeUp", // 11
  };
  
  for (int i = 1; i <= Buttons.length; i++) {
    float ButtonWidth = AppWidth * 110/GUIWidth;
    float ButtonHeight = AppHeight * 110/GUIHeight;
  
    float Padding = 10;
  
    float ButtonXPos = AppWidth * (205 + (i * (ButtonWidth + Padding)))/GUIWidth;
    float ButtonYPos = AppHeight * 955 / GUIHeight;
    
    // Check for hover
    if (mouseX >= ButtonXPos && mouseX <= ButtonXPos + ButtonWidth && mouseY >= ButtonYPos && mouseY <= ButtonYPos + ButtonHeight) {
      fill(150);
      HoveringOverButton = true;
    } else {
      fill(255);
    }
    
    rect(ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight, 3);
    
    // Placing Button Images
    if (i == 1) { // Previous Button
      image(FastForwardButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 2) { // Previous Button
      image(FasterForwardButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 3) { // Unmute
      image(VolumeUpImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 4) { // Previous Button
      image(PreviousButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 5) { // Pause Button
      image(PauseButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 6) { // Play Button
      image(PlayButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 7) { // Stop Button
      image(StopButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 8) { // Skip Button
      image(SkipButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 9) { // Mute Button
      image(MuteButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 10) { // Lower Volume
      image(VolumeDownImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 11) { // Higher Volume
      image(VolumeUpImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
  }
  
  if (HoveringOverButton == true) {
     cursor(HAND);
   } else {
     cursor(ARROW);
   }
}
