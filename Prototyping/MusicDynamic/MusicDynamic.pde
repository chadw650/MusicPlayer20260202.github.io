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
  size(700, 700);

  minim = new Minim(this);
  playlist = new AudioPlayer[numberOfSongs];
  soundEffects = new AudioPlayer[numberOfSFX];

  String[] SongName = new String[numberOfSongs];

  for (int i = 0; i < numberOfSongs; i++) {
    if (i == 0) {
      SongName[i] = MusicFolder + "Aerie.mp3";
    }
  }

  String SFX1 = SFXFolder + "MouseClick.mp3";

  playlist[currentSong] = minim.loadFile(SongName[currentSong]);
  soundEffects[0] = minim.loadFile(SFX1);

  if (playlist[currentSong] == null) {
    println("Error loading song: " + SongName[currentSong]);
  } else {
    println("Song loaded OK: " + SongName[currentSong]);
  }
}

void draw() {
  background(0);
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
