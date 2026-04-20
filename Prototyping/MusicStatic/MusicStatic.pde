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
AudioPlayer[] Playlist = new AudioPlayer[numberOfSongs];
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSFX]
int CurrentSong = numberOfSongs - numberOfSongs;
