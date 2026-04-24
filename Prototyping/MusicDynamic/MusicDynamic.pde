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
    // playlist[currentSong].play();
  } else {
    println("Error loading song: " + SongName[currentSong]);
    printArray(SongName);
  }
  
  if (key=='p' || key=='P') playlist[currentSong].loop(0);
  
  if (key=='O' || key=='o') {
    if (playlist[currentSong].isPlaying()) {
      playlist[currentSong].pause();
    } else {
      playlist[currentSong].play();
    };
  };
}

void draw() {
  background(0);
}


 /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ; //'' only
   -
   if ( key==CODED || keyCode==SpecialKey ) ; //Special Keys abriviated CAPS
   -
   All Music Player Features are built out of these Minim AudioPlayer() functions
   .isPlaying()
   .isMuted()
   .loop(0), parameter is number of iterations after play
   .loop(), parameter is infinite interations
   .play(), parameter is built-in skip (milli-seconds or crystal-time)
   .pause()
   .rewind()
   .skip()
   .unmute()
   .mute()
   
 */
