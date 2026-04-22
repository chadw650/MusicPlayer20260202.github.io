// Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Variables (declarations are fine at the top)
Minim minim;
int numberOfSongs = 1;
int numberOfSFX = 1;
AudioPlayer[] playlist;
AudioPlayer[] soundEffects;
int currentSong = 0;

String upArrow = "../../";
String dependencies = upArrow + "Dependencies/";
String MusicFolder = dependencies + "Music/";
String SFXFolder = dependencies + "SoundFX/";

void setup() {
  size(700, 700);
  
  playlist = new AudioPlayer[numberOfSongs];
  soundEffects = new AudioPlayer[numberOfSFX];
  
  minim = new Minim(this);

  String Song1 = MusicFolder + "Aerie.mp3";
  String SFX1 = SFXFolder + "MouseClick.mp3";

  playlist[currentSong] = minim.loadFile(Song1);
  soundEffects[currentSong] = minim.loadFile(SFX1);

  if (playlist[currentSong] != null) {
    playlist[currentSong].loop();
  } else {
    println("Error loading song: " + Song1);
  }
}

void draw() {
  background(0);
}
