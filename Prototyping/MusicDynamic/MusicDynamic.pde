// Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Variables (declarations are fine at the top)
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
  
  playlist = new AudioPlayer[numberOfSongs];
  soundEffects = new AudioPlayer[numberOfSFX];
  
  minim = new Minim(this);

  String SongName[] = new String[numberOfSongs];
  
  for (int i = 0; i <= numberOfSongs; i++) {
    if (i == 0) {
      SongName[i] = MusicFolder + "Aerie.mp3";
    };
  };
 
  String SFX1 = SFXFolder + "MouseClick.mp3";

  playlist[currentSong] = minim.loadFile(SongName[currentSong]);
  soundEffects[currentSong] = minim.loadFile(SFX1);

  if (playlist[currentSong] != null) {
    playlist[currentSong].loop();
  } else {
    println("Error loading song: " + SongName[currentSong]);
  }
}

void draw() {
  background(0);
}
