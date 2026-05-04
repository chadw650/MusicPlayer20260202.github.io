/* 

Music Player, Final

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

String upArrow = "../../";
String dependencies = upArrow + "Dependencies/";
String MusicFolder = dependencies + "Music/";
String SFXFolder = dependencies + "SoundFX/";

int numberOfSongs = 2;
int numberOfSFX = 1;

float CurrentSongTextXPos, CurrentSongTextYPos, CurrentSongTextXSize, CurrentSongTextYSize;

String[] labels;
float[] targetWidths;
float[] targetHeights;
float[] targetX;
float[] targetY;
float[] FontSizes;
PFont Font;

color Black, ResetInk;

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

  // Home Button
  float HomeButtonXPos = AppWidth * 10/GUIWidth;
  float HomeButtonYPos = AppHeight * 10/GUIHeight;

  float HomeButtonXSize = AppWidth * 290/GUIWidth;
  float HomeButtonYSize = AppHeight * 35/GUIHeight;

  // Current song Text
  CurrentSongTextXPos = AppWidth * 325/GUIWidth;
  CurrentSongTextYPos = AppHeight * 55/GUIHeight;

  CurrentSongTextXSize = AppWidth * 200/GUIWidth;
  CurrentSongTextYSize = AppHeight * 35/GUIHeight;

  // NowPlayingText
  float NowPlayingTextXPos = AppWidth * 320 / GUIWidth;
  float NowPlayingTextYPos = AppHeight * 10 / GUIHeight;

  float NowPlayingTextXSize = AppWidth * 300 / GUIWidth;
  float NowPlayingTextYSize = AppHeight * 35 / GUIHeight;

  // Lyrics Title
  float LyricsTitleXPos = AppWidth * 1620/GUIWidth;
  float LyricsTitleYPos = AppHeight * 10/GUIHeight;

  float LyricsTitleXSize = AppWidth * 290/GUIWidth;
  float LyricsTitleYSize = AppHeight * 35/GUIHeight;

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
  String NowPlayingString = "Now Playing";

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
    } else {
      fill(255);
    }

    rect(ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight, 3);

    // Placing Button Images
    if (i == 1) image(FastForwardButtonImg,   ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 2) image(FasterForwardButtonImg, ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 3) image(LoopButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 4) image(PreviousButtonImg,      ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 5) image(PauseButtonImg,         ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 6) image(PlayButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 7) image(StopButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 8) image(SkipButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 9) image(MuteButtonImg,          ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 10) image(VolumeDownImg,         ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
    if (i == 11) image(VolumeUpImg,           ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight);
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

  if (key == CODED || keyCode == ESC) exit();
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
