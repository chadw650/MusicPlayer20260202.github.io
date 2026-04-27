import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer[] playlist;
AudioPlayer[] soundEffects;
int currentSong = 0;

String upArrow = "../../";
String dependencies = upArrow + "Dependencies/";
String MusicFolder = dependencies + "Music/";
String SFXFolder = dependencies + "SoundFX/";

int numberOfSongs = 1;
int numberOfSFX = 1;

void setup() {
  float AppWidth = displayWidth;
  float AppHeight = displayHeight;

  float GUIWidth = 1920;
  float GUIHeight = 1080;
  
  fullScreen();
  
  // Div
  // Left side
  
  // Home Button
  float HomeButtonXPos = AppWidth * 10/GUIWidth;
  float HomeButtonYPos = AppHeight * 10/GUIHeight;
  
  float HomeButtonXSize = AppWidth * 290/GUIWidth;
  float HomeButtonYSize = AppHeight * 35/GUIHeight;
  
  rect(HomeButtonXPos, HomeButtonYPos, HomeButtonXSize, HomeButtonYSize, 3);
  
  // Middle
  
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
  
  // Right Side
  
  // Lyrics Title
  float LyricsTitleXPos = AppWidth * 1620/GUIWidth;
  float LyricsTitleYPos = AppHeight * 10/GUIHeight;
  
  float LyricsTitleXSize = AppWidth * 290/GUIWidth;
  float LyricsTitleYSize = AppHeight * 35/GUIHeight;
  
  rect(LyricsTitleXPos, LyricsTitleYPos, LyricsTitleXSize, LyricsTitleYSize, 3);
  
  minim = new Minim(this);
  playlist = new AudioPlayer[numberOfSongs];
  soundEffects = new AudioPlayer[numberOfSFX];

  String[] SongName = new String[numberOfSongs];

  for (int i = 0; i < numberOfSongs; i++) {
    if (i == 0) {
      SongName[i] = MusicFolder + "Aerie.mp3";
    }
  }
  
  String[] SFXName = new String[numberOfSFX];
  
  for (int i = 0; i < numberOfSFX; i++) {
    if (i == 0) {
      SFXName[i] = SFXFolder + "MouseClick.mp3";
    }
  }
  
  String SFX1 = SFXFolder + "MouseClick.mp3";
  soundEffects[0] = minim.loadFile(SFX1);
  
  for (int i = 0; i < numberOfSFX; i++) {
    soundEffects[i] = minim.loadFile(SFXName[i]);
    if (soundEffects[i] == null) {
      println("Error loading song: " + SFXName[i]);
    } else {
      println("Song loaded OK: " + SFXName[i]);
    }
  }

  for (int i = 0; i < numberOfSongs; i++) {
    playlist[i] = minim.loadFile(SongName[i]);
    if (playlist[i] == null) {
      println("Error loading song: " + SongName[i]);
    } else {
      println("Song loaded OK: " + SongName[i]);
    }
  }
  
  String x = "X";
  
  // Strings
  String Title = "Aerie";
  String HomeButton = "Home";

  // Fonts
  PFont Font;
  String LeelawadeeUIBold = "Leelawadee UI Bold";

  float FontSizes[] = new float[3];

  String[] labels = { Title, HomeButton };

  float[]  targetWidths = { CurrentSongTextXSize, HomeButtonXSize };
  float[]  targetHeights = { CurrentSongTextYSize, HomeButtonYSize };

  float[]  targetX = { CurrentSongTextXPos, HomeButtonXPos };
  float[]  targetY = { CurrentSongTextYPos, HomeButtonYPos };

  for (int i = 0; i < labels.length; i++) {
    float targetHeight = targetHeights[i];
    float targetWidth = targetWidths[i]; 
    String textToMeasure = labels[i];

    float baseSize = 100.0;
    textSize(baseSize);
    float currentWidth = textWidth(textToMeasure);

    float sizeToFitWidth = baseSize * (targetWidth / currentWidth);
    float sizeToFitHeight = targetHeight * 0.85;
  
    if (sizeToFitWidth < sizeToFitHeight) {
      FontSizes[i] = int(sizeToFitWidth);
    } else {
      FontSizes[i] = int(sizeToFitHeight);
    }
  }

  Font = createFont(LeelawadeeUIBold, 32);

  // Drawing Text
  color White = #FFFFFFFF;
  color Black = #030000;
  color ResetInk = White;

  fill(Black);
  textAlign(CENTER, CENTER);
  
  for (int i = 0; i < labels.length; i++) {
    textFont(Font, FontSizes[i]);
    text(labels[i], targetX[i], targetY[i], targetWidths[i], targetHeights[i]);
  }
}

void draw() {
  soundEffects[0].play();
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
      playlist[currentSong].play();
    } else {
      playlist[currentSong].rewind();
      currentSong = (currentSong == numberOfSongs - 1) ? 0 : currentSong + 1;
    }
  }

  if (key == 'Y' || key == 'y') currentSong = int(random(numberOfSongs));
}
