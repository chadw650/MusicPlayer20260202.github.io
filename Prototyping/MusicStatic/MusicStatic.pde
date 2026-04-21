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
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSFX];
int CurrentSong = numberOfSongs - numberOfSongs;

// Display
size(700, 700);
int AppHeight = displayHeight;
int AppWidth = displayWidth;
// fullScreen();

minim = new Minim(this);

String upArrow = "../../";
String dependencies = upArrow + "Dependencies/";
String MusicFolder = dependencies + "Music/";
String SFXFolder = dependencies + "SoundFX/";

// Songs/SFX
String Song1 = MusicFolder + "Aerie.mp3";

String SFX1 = SFXFolder + "MouseClick.mp3";

playlist[CurrentSong] = minim.loadFile(Song1);
soundEffects[CurrentSong] = minim.loadFile(SFX1);

if (playlist[CurrentSong] != null) {
    playlist[CurrentSong].play();
    printArray(playlist);
} else {
    println("Error loading song: " + Song1);
}
