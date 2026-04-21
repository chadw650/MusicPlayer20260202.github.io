// Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Variables
Minim minim;
int numberOfSongs = 1;
int numberOfSFX = 1;
AudioPlayer[] playlist = new AudioPlayer[numberOfSongs];
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSFX]
int CurrentSong = numberOfSongs - numberOfSongs;

// Display
size(700, 700);
int AppHeight = DisplayHeight;
int AppWidth = DisplayWidth;
// fullScreen();

minim = new Minim(this);

String upArrow = "../../";
String dependencies = upArrow + "Dependencies/";
String MusicFolder = dependencies + "Music/";
String SFXFolder = dependencies + "SoundFX/";

// Songs/SFX
playlist[0] = minim.loadFile(MusicFolder + "Aerie.mp3");
soundEffects[0] = minim.loadFile(SFXFolder + "MouseClick.mp3");