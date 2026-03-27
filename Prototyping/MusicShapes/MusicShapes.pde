// Make sure to download the images!!!!!

float GUIWidth = 1920;
float GUIHeight = 1080;
  
int AppWidth = displayWidth;
int AppHeight = displayHeight;

fullScreen();
  
  // Load Images
PImage FastForwardButtonImg = loadImage("FastForward.png");
PImage FasterForwardButtonImg = loadImage("FasterForward.png");
PImage PreviousButtonImg = loadImage("PreviousSong.png");
PImage LoopButtonImg = loadImage("LoopButton.png");
PImage PlayButtonImg = loadImage("Playbutton.png");
PImage PauseButtonImg = loadImage("PauseButton.png");
PImage StopButtonImg = loadImage("StopButton.png");
PImage SkipButtonImg = loadImage("SkipSong.png");
PImage MuteButtonImg = loadImage("MuteSong.png");
PImage VolumeDownImg = loadImage("LowerVolume.png");
PImage VolumeUpImg = loadImage("VolumeUp.png");
  
String[] Buttons = {
   "FastForward", // 1
   "FasterForward", // 2
   "LoopButton", // 3
   "GoBackSong", // 4
   "Pause", // 5
   "Play", // 6
   "Stop", // 7
   "SkipSong", // 8
   "MuteSong", // 9
   "VolumeDown", // 10
   "VolumeUp", // 11
};
  
for (int i = 1; i < Buttons.length; i++) {
    println(Buttons[i]);
}
  
  // Music Player Buttons
for (int i = 1; i <= Buttons.length; i++) {
    float ButtonWidth = AppWidth * 110/GUIWidth;
    float ButtonHeight = AppHeight * 110/GUIHeight;
  
    float Padding = 10;
  
    float ButtonXPos = AppWidth * (180 + (i * (ButtonWidth + Padding)))/GUIWidth;
    float ButtonYPos = AppHeight * 955 / GUIHeight;
    
    rect(ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight, 3);
    
    // Placing Button Images
    if (i == 1) { // Previous Button
      image(FastForwardButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 2) { // Previous Button
      image(FasterForwardButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    }
    
    if (i == 3) { // Unmute
      image(LoopButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
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
