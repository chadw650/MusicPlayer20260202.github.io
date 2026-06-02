/* Music Player, Final

*/

// Libraries

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables

int AppWidth, AppHeight;

float GUIWidth = 1920;
float GUIHeight = 1080;

PImage FastForwardButtonImg;
PImage FasterForwardButtonImg;
PImage LoopButtonImg;
PImage PreviousButtonImg;
PImage PlayButtonImg;
PImage PauseButtonImg;
PImage StopButtonImg;
PImage SkipButtonImg;
PImage MuteButtonImg;
PImage VolumeDownImg;
PImage VolumeUpImg;

Minim minim;
AudioPlayer[] playlist;
AudioPlayer[] soundEffects;
int currentSong = 0;
String currentSongTitle = "Unknown";

String upArrow = "../";
String dependencies = upArrow + "Dependencies/";
String MusicFolder = dependencies + "Music/";
String SFXFolder = dependencies + "SoundFX/";

int numberOfSongs = 2;
int numberOfSFX = 1;

// Cached Layout Variables
float HomeButtonXPos, HomeButtonYPos, HomeButtonXSize, HomeButtonYSize;
float CurrentSongTextXPos, CurrentSongTextYPos, CurrentSongTextXSize, CurrentSongTextYSize;
float NowPlayingTextXPos, NowPlayingTextYPos, NowPlayingTextXSize, NowPlayingTextYSize;
float LyricsTitleXPos, LyricsTitleYPos, LyricsTitleXSize, LyricsTitleYSize;

float MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize;
float PlaylistContainerXPos, PlaylistContainerYPos, PlaylistContainerXSize, PlaylistContainerYSize;
float MusicContainerXPos, MusicContainerYPos, MusicContainerXSize, MusicContainerYSize;
float CurrentSongXPos, CurrentSongYPos, CurrentSongXSize, CurrentSongYSize;
float NextSong1XPos, NextSong1YPos, NextSong1XSize, NextSong1YSize;
float NextSong2XPos, NextSong2YPos, NextSong2XSize, NextSong2YSize;
float NextSong3XPos, NextSong3YPos, NextSong3XSize, NextSong3YSize;
float ProgressBarXPos, ProgressBarYPos, ProgressBarXSize, ProgressBarYSize;
float LyricsContainerXPos, LyricsContainerYPos, LyricsContainerXSize, LyricsContainerYSize;
float LyricsXPos, LyricsYPos, LyricsXSize, LyricsYSize;
float MPContainerXPos, MPContainerYPos, MPContainerXSize, MPContainerYSize;

String[] labels;
float[] targetWidths;
float[] targetHeights;
float[] targetX;
float[] targetY;
float[] FontSizes;
PFont Font;

color Black, ResetInk;

// Image Variables
String ImagesFolder = "Images";
String FileExtension = ".png";
String open = "/";
String[] ImageName = {
  "Roblox",
  "Bike",
};
String ImageDirectory;
String[] Pathway;
PImage[] Images;
String FallbackPathway;

boolean PlayButton;

void setup() {
  fullScreen();

  AppWidth = displayWidth;
  AppHeight = displayHeight;

  // Load Images
  FastForwardButtonImg = loadImage("FastForward.png");
  FasterForwardButtonImg = loadImage("FasterForward.png");
  LoopButtonImg = loadImage("LoopButton.png");
  PreviousButtonImg = loadImage("PreviousSong.png");
  PlayButtonImg = loadImage("Playbutton.png");
  PauseButtonImg = loadImage("PauseButton.png");
  StopButtonImg = loadImage("StopButton.png");
  SkipButtonImg = loadImage("SkipSong.png");
  MuteButtonImg = loadImage("MuteSong.png");
  VolumeDownImg = loadImage("LowerVolume.png");
  VolumeUpImg = loadImage("VolumeUp.png");

  // Load Album Art Images
  ImageDirectory = upArrow + open + "Dependencies" + open + ImagesFolder + open;
  Pathway = new String[ImageName.length];
  Images = new PImage[ImageName.length];
  FallbackPathway = ImageDirectory + "Bike" + FileExtension;
  
  for (int i = 0; i < ImageName.length; i++) {
    Pathway[i] = sketchPath(ImageDirectory + ImageName[i] + FileExtension);
    Images[i] = loadImage(Pathway[i]);

    if (Images[i] == null) {
      Images[i] = loadImage(FallbackPathway);
    }
  }

  // Caching Layout Geometry
  
  // Home Button
  HomeButtonXPos = AppWidth * 10/GUIWidth;
  HomeButtonYPos = AppHeight * 10/GUIHeight;
  HomeButtonXSize = AppWidth * 290/GUIWidth;
  HomeButtonYSize = AppHeight * 35/GUIHeight;

  // Current song Text
  CurrentSongTextXPos = AppWidth * 325/GUIWidth;
  CurrentSongTextYPos = AppHeight * 55/GUIHeight;
  CurrentSongTextXSize = AppWidth * 200/GUIWidth;
  CurrentSongTextYSize = AppHeight * 35/GUIHeight;

  // NowPlayingText
  NowPlayingTextXPos = AppWidth * 320 / GUIWidth;
  NowPlayingTextYPos = AppHeight * 10 / GUIHeight;
  NowPlayingTextXSize = AppWidth * 300 / GUIWidth;
  NowPlayingTextYSize = AppHeight * 35 / GUIHeight;

  // Lyrics Title
  LyricsTitleXPos = AppWidth * 1620/GUIWidth;
  LyricsTitleYPos = AppHeight * 10/GUIHeight;
  LyricsTitleXSize = AppWidth * 290/GUIWidth;
  LyricsTitleYSize = AppHeight * 35/GUIHeight;

  // Main Container
  MainContainerXPos = AppWidth * 5/GUIWidth;
  MainContainerYPos = AppHeight * 5/GUIHeight;
  MainContainerXSize = AppWidth * 300/GUIWidth;
  MainContainerYSize = AppHeight * 500/GUIHeight;

  // Playlist Container
  PlaylistContainerXPos = AppWidth * 5/GUIWidth;
  PlaylistContainerYPos = AppHeight * 510/GUIHeight;
  PlaylistContainerXSize = AppWidth * 300/GUIWidth;
  PlaylistContainerYSize = AppHeight * 565/GUIHeight;

  // Music Container
  MusicContainerXPos = AppWidth * 310/GUIWidth;
  MusicContainerYPos = AppHeight * 5/GUIHeight;
  MusicContainerXSize = AppWidth * 1300/GUIWidth;
  MusicContainerYSize = AppHeight * 900/GUIHeight;

  // Current Song Block
  CurrentSongXPos = AppWidth * 320/GUIWidth;
  CurrentSongYPos = AppHeight * 50/GUIHeight;
  CurrentSongXSize = AppWidth * 1280/GUIWidth;
  CurrentSongYSize = AppHeight * 600/GUIHeight;

  // Next Song 1
  NextSong1XPos = AppWidth * 320/GUIWidth;
  NextSong1YPos = AppHeight * 650/GUIHeight;
  NextSong1XSize = AppWidth * 1280/GUIWidth;
  NextSong1YSize = AppHeight * 80/GUIHeight;

  // Next Song 2
  NextSong2XPos = AppWidth * 320/GUIWidth;
  NextSong2YPos = AppHeight * 730/GUIHeight;
  NextSong2XSize = AppWidth * 1280/GUIWidth;
  NextSong2YSize = AppHeight * 80/GUIHeight;

  // Next Song 3
  NextSong3XPos = AppWidth * 320/GUIWidth;
  NextSong3YPos = AppHeight * 810/GUIHeight;
  NextSong3XSize = AppWidth * 1280/GUIWidth;
  NextSong3YSize = AppHeight * 80/GUIHeight;

  // Progress Bar
  ProgressBarXPos = AppWidth * 310/GUIWidth;
  ProgressBarYPos = AppHeight * 910/GUIHeight;
  ProgressBarXSize = AppWidth * 1300/GUIWidth;
  ProgressBarYSize = AppHeight * 25/GUIHeight;

  // Lyrics Container
  LyricsContainerXPos = AppWidth * 1615/GUIWidth;
  LyricsContainerYPos = AppHeight * 5/GUIHeight;
  LyricsContainerXSize = AppWidth * 300/GUIWidth;
  LyricsContainerYSize = AppHeight * 930/GUIHeight;

  // Lyrics Text Area
  LyricsXPos = AppWidth * 1620/GUIWidth;
  LyricsYPos = AppHeight * 50/GUIHeight;
  LyricsXSize = AppWidth * 290/GUIWidth;
  LyricsYSize = AppHeight * 880/GUIHeight;

  // Music Player Container
  MPContainerXPos = AppWidth * 310/GUIWidth;
  MPContainerYPos = AppHeight * 940/GUIHeight;
  MPContainerXSize = AppWidth * 1605/GUIWidth;
  MPContainerYSize = AppHeight * 135/GUIHeight;


  minim = new Minim(this);
  playlist = new AudioPlayer[numberOfSongs];
  soundEffects = new AudioPlayer[numberOfSFX];

  String[] SongName = new String[numberOfSongs];

  for (int i = 0; i < numberOfSongs; i++) {
    if (i == 0) {
      SongName[i] = MusicFolder + "Aerie.mp3";
    }

    if (i == 1) {
      SongName[i] = MusicFolder + "NeverGonnaGiveYouUp.mp3";
    }
  }

  String[] SFXName = new String[numberOfSFX];

  for (int i = 0; i < numberOfSFX; i++) {
    if (i == 0) {
      SFXName[i] = SFXFolder + "MouseClick.mp3";
    }
  }

  for (int i = 0; i < numberOfSFX; i++) {
    soundEffects[i] = minim.loadFile(SFXName[i]);
    if (soundEffects[i] == null) {
      println("Error loading SFX: " + SFXName[i]);
    } else {
      println("SFX loaded OK: " + SFXName[i]);
    }
  }

  for (int i = 0; i < numberOfSongs; i++) {
    playlist[i] = minim.loadFile(SongName[i]);
    if (playlist[i] == null) {
      println("Error loading song: " + SongName[i]);
    } else {
      AudioMetaData meta = playlist[i].getMetaData();
      if (i == currentSong) {
        currentSongTitle = (meta.title() != null && !meta.title().equals("")) ? meta.title() : SongName[i];
      }
      println("Song loaded OK: " + SongName[i] + " | Title: " + currentSongTitle);
    }
  }

  // Strings
  String HomeButton = "Home";
  String LyricsTitle = "Lyrics";
  String NowPlayingString = "Stopped"; // Initial state set to Stopped

  // Fonts
  String LeelawadeeUIBold = "Leelawadee UI Bold";

  labels = new String[]{ currentSongTitle, HomeButton, LyricsTitle, NowPlayingString };

  FontSizes = new float[labels.length];

  targetWidths  = new float[]{ CurrentSongTextXSize, HomeButtonXSize, LyricsTitleXSize, NowPlayingTextXSize };
  targetHeights = new float[]{ CurrentSongTextYSize, HomeButtonYSize, LyricsTitleYSize, NowPlayingTextYSize };
  targetX       = new float[]{ CurrentSongTextXPos,  HomeButtonXPos,  LyricsTitleXPos,  NowPlayingTextXPos  };
  targetY       = new float[]{ CurrentSongTextYPos,  HomeButtonYPos,  LyricsTitleYPos,  NowPlayingTextYPos  };

  for (int i = 0; i < labels.length; i++) {
    float targetHeight = targetHeights[i];
    float targetWidth  = targetWidths[i];
    String textToMeasure = labels[i];

    float baseSize = 100.0;
    textSize(baseSize);
    float currentWidth = textWidth(textToMeasure);

    float sizeToFitWidth  = baseSize * (targetWidth / currentWidth);
    float sizeToFitHeight = targetHeight * 0.85;

    FontSizes[i] = int(min(sizeToFitWidth, sizeToFitHeight));
  }

  Font = createFont(LeelawadeeUIBold, 32);

  color White = #FFFFFFFF;
  Black = #030000;
  color DarkPurple = #301950;
  ResetInk = White;

  fill(Black);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < labels.length; i++) {
    textFont(Font, FontSizes[i]);
    text(labels[i], targetX[i], targetY[i], targetWidths[i], targetHeights[i]);
  }

  fill(ResetInk);
}

void draw() {
  background(200);

  // STATE CHECK: Dynamically update labels[3] based on current play status
  if (playlist[currentSong].isPlaying()) {
    labels[3] = "Playing";
  } else if (playlist[currentSong].position() == 0) {
    labels[3] = "Stopped";
  } else {
    labels[3] = "Paused";
  }

  fill(255);
  stroke(0);
  strokeWeight(1);

  boolean HoveringOverButton = false;
  PlayButton = false;

  // Left side
  // Main Container
  rect(MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize, 3);

  // Home Button
  rect(HomeButtonXPos, HomeButtonYPos, HomeButtonXSize, HomeButtonYSize, 3);

  // Playlist Container
  rect(PlaylistContainerXPos, PlaylistContainerYPos, PlaylistContainerXSize, PlaylistContainerYSize, 3);


  // Middle
  // Music Container
  rect(MusicContainerXPos, MusicContainerYPos, MusicContainerXSize, MusicContainerYSize, 3);

  // Current Song
  rect(CurrentSongXPos, CurrentSongYPos, CurrentSongXSize, CurrentSongYSize, 3);

  // Album Art Images
  for (int i = 0; i < ImageName.length; i++) {
    float Width = CurrentSongXSize;
    float Height = CurrentSongYSize;

    float OriginalW = Images[i].width;
    float OriginalH = Images[i].height;

    float scale = min(Width / OriginalW, Height / OriginalH);

    float NewWidth = OriginalW * scale;
    float NewHeight = OriginalH * scale;

    float XOffset = CurrentSongXPos + (CurrentSongXSize - NewWidth) / 2;
    float YOffset = CurrentSongYPos + (CurrentSongYSize - NewHeight) / 2;
    
    if (currentSong == i) {
      image(Images[i], XOffset, YOffset, NewWidth, NewHeight);
    }
  }

  // Current song Text
  rect(CurrentSongTextXPos, CurrentSongTextYPos, CurrentSongTextXSize, CurrentSongTextYSize, 3);

  // NowPlayingText
  rect(NowPlayingTextXPos, NowPlayingTextYPos, NowPlayingTextXSize, NowPlayingTextYSize, 3);

  // Next Song 1
  rect(NextSong1XPos, NextSong1YPos, NextSong1XSize, NextSong1YSize, 3);

  // Next Song 2
  rect(NextSong2XPos, NextSong2YPos, NextSong2XSize, NextSong2YSize, 3);

  // Next Song 3
  rect(NextSong3XPos, NextSong3YPos, NextSong3XSize, NextSong3YSize, 3);

  // Progress Bar
  rect(ProgressBarXPos, ProgressBarYPos, ProgressBarXSize, ProgressBarYSize, 3);


  // Right Side
  // Lyrics Container
  rect(LyricsContainerXPos, LyricsContainerYPos, LyricsContainerXSize, LyricsContainerYSize, 3);

  // Lyrics Title
  rect(LyricsTitleXPos, LyricsTitleYPos, LyricsTitleXSize, LyricsTitleYSize, 3);

  // Lyrics
  rect(LyricsXPos, LyricsYPos, LyricsXSize, LyricsYSize, 3);


  // Main Player
  // Music Player Container
  rect(MPContainerXPos, MPContainerYPos, MPContainerXSize, MPContainerYSize, 3);

  String[] Buttons = {
    "FastForward",    // 1
    "FasterForward",  // 2
    "LoopButton",     // 3
    "GoBackSong",     // 4
    "Pause",          // 5
    "Play",           // 6
    "Stop",           // 7
    "SkipSong",       // 8
    "MuteSong",       // 9
    "VolumeDown",     // 10
    "VolumeUp",       // 11
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
      if (i == 6) PlayButton = true; 
    } else {
      fill(255);
    }

    rect(ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight, 3);

    // Placing Button Images
    if (i ==  1) image(FastForwardButtonImg,   ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  2) image(FasterForwardButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  3) image(LoopButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  4) image(PreviousButtonImg,      ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  5) image(PauseButtonImg,         ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  6) image(PlayButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  7) image(StopButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  8) image(SkipButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i ==  9) image(MuteButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 10) image(VolumeDownImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 11) image(VolumeUpImg,            ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
  }

  if (HoveringOverButton == true) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  // Text
  fill(Black);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < labels.length; i++) {
    float targetHeight = targetHeights[i];
    float targetWidth  = targetWidths[i];
    String textToMeasure = labels[i];

    float baseSize = 100.0;
    textSize(baseSize);
    float currentWidth = textWidth(textToMeasure);

    float sizeToFitWidth  = baseSize * (targetWidth / currentWidth);
    float sizeToFitHeight = targetHeight * 0.85;

    FontSizes[i] = int(min(sizeToFitWidth, sizeToFitHeight));
  }

  for (int i = 0; i < labels.length; i++) {
    textFont(Font, FontSizes[i]);
    text(labels[i], targetX[i], targetY[i], targetWidths[i], targetHeights[i]);
  }

  fill(ResetInk);
}

void mousePressed() {
  soundEffects[0].rewind();
  soundEffects[0].play();

  if (PlayButton == true) {
    playlist[currentSong].loop(0);
  }

  for (int i = 1; i <= 11; i++) {
    float ButtonWidth = AppWidth * 110/GUIWidth;
    float ButtonHeight = AppHeight * 110/GUIHeight;
    float Padding = 10;
    float ButtonXPos = AppWidth * (205 + (i * (ButtonWidth + Padding)))/GUIWidth;
    float ButtonYPos = AppHeight * 955 / GUIHeight;

    if (mouseX >= ButtonXPos && mouseX <= ButtonXPos + ButtonWidth && mouseY >= ButtonYPos && mouseY <= ButtonYPos + ButtonHeight) {
      
      if (i == 1) {
        playlist[currentSong].skip(5000); 
      }
      
      if (i == 2) {
        playlist[currentSong].skip(15000); 
      }
      
      if (i == 3) {
        playlist[currentSong].loop(); 
      }
      
      if (i == 4) {
        if (playlist[currentSong].isPlaying()) {
          playlist[currentSong].pause();
          playlist[currentSong].rewind();
          currentSong = (currentSong == 0) ? numberOfSongs - 1 : currentSong - 1;
          updateSongTitle();
          playlist[currentSong].play();
        } else {
          playlist[currentSong].rewind();
          currentSong = (currentSong == 0) ? numberOfSongs - 1 : currentSong - 1;
          updateSongTitle();
        }
      }
      
      if (i == 5) {
        if (playlist[currentSong].isPlaying()) {
          playlist[currentSong].pause();
        }
      }
    
      if (i == 6) playlist[currentSong].loop(0);
      
      if (i == 7) {
        playlist[currentSong].pause();
        playlist[currentSong].rewind();
      }
      
      if (i == 8) {
        if (playlist[currentSong].isPlaying()) {
          playlist[currentSong].pause();
          playlist[currentSong].rewind();
          currentSong = (currentSong == numberOfSongs - 1) ? 0 : currentSong + 1;
          updateSongTitle();
          playlist[currentSong].play();
        } else {
          playlist[currentSong].rewind();
          currentSong = (currentSong == numberOfSongs - 1) ? 0 : currentSong + 1;
          updateSongTitle();
        }
      }
      
      if (i == 9) {
        if (playlist[currentSong].isMuted()) {
          playlist[currentSong].unmute();
        } else {
          playlist[currentSong].mute();
        }
      }
      
      if (i == 10) {
        playlist[currentSong].setGain(playlist[currentSong].getGain() - 5.0);
      }
      
      if (i == 11) {
        playlist[currentSong].setGain(playlist[currentSong].getGain() + 5.0);
      }
      
    }
  }
}

void updateSongTitle() {
  AudioMetaData meta = playlist[currentSong].getMetaData();
  currentSongTitle = (meta.title() != null && !meta.title().equals("")) ? meta.title() : "Track " + (currentSong + 1);
  labels[0] = currentSongTitle;
}

void keyPressed() {
  if (key == 'P' || key == 'p') playlist[currentSong].loop(0);

  if (key == 'O' || key == 'o') {
    if (playlist[currentSong].isPlaying()) {
      playlist[currentSong].pause();
    } else {
      playlist[currentSong].play();
    }
  }

  if (key == 'S' || key == 's') {
    if (playlist[currentSong].isPlaying()) {
      playlist[currentSong].pause();
    } else {
      playlist[currentSong].rewind();
    }
  }

  if (key == 'L' || key == 'l') playlist[currentSong].loop(1);
  if (key == 'K' || key == 'k') playlist[currentSong].loop();
  if (key == 'F' || key == 'f') playlist[currentSong].skip(10000);
  if (key == 'R' || key == 'r') playlist[currentSong].skip(-10000);

  if (key == 'W' || key == 'w') {
    if (playlist[currentSong].isMuted()) {
      playlist[currentSong].unmute();
    } else {
      playlist[currentSong].mute();
    }
  }

  if (key == 'Q' || key == 'q') exit();

  if (key == 'N' || key == 'n') {
    if (playlist[currentSong].isPlaying()) {
      playlist[currentSong].pause();
      playlist[currentSong].rewind();
      currentSong = (currentSong == numberOfSongs - 1) ? 0 : currentSong + 1;
      updateSongTitle();
      playlist[currentSong].play();
    } else {
      playlist[currentSong].rewind();
      currentSong = (currentSong == numberOfSongs - 1) ? 0 : currentSong + 1;
      updateSongTitle();
    }
  }

  if (key == 'Y' || key == 'y') {
    currentSong = int(random(numberOfSongs));
    updateSongTitle();
  }
}

// End Main Program
