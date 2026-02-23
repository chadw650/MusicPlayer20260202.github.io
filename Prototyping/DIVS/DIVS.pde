/*
 DIVS 2D Rectangles
 
 :))
 
 */

println(displayWidth, displayHeight);

fullScreen();

int AppWidth = displayWidth;
int AppHeight = displayHeight;

int GUIWidth = 1920;
int GUIHeight = 1080;

size(displayWidth, displayHeight);

// Left side

// Main Container
float MainContainerXPos = AppWidth * 5/GUIWidth;
float MainContainerYPos = AppHeight * 5/GUIHeight;

float MainContainerXSize = AppWidth * 300/GUIWidth;
float MainContainerYSize = AppHeight * 500/GUIHeight;

rect(MainContainerXPos, MainContainerYPos, MainContainerXSize, MainContainerYSize, 3);

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


// Next Song 1
float NextSong1XPos = AppWidth * 320/GUIWidth;
float NextSong1YPos = AppHeight * 650/GUIHeight;

float NextSong1XSize = AppWidth * 1280/GUIWidth;
float NextSong1YSize = AppHeight * 100/GUIHeight;

rect(NextSong1XPos, NextSong1YPos, NextSong1XSize, NextSong1YSize, 3);

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


// Main Player

// Music Player Container
float MPContainerXPos = AppWidth * 310/GUIWidth;
float MPContainerYPos = AppHeight * 940/GUIHeight;

float MPContainerXSize = AppWidth * 1605/GUIWidth;
float MPContainerYSize = AppHeight * 135/GUIHeight;

rect(MPContainerXPos, MPContainerYPos, MPContainerXSize, MPContainerYSize, 3);

/* String[] Buttons = {
 "Play", // 1
 "Pause" // 2
 };
 */

// Music Player Buttons
for (int i = 0; i <= 10; i++) {
  float ButtonWidth = AppWidth * 110/GUIWidth;
  float ButtonHeight = AppHeight * 110/GUIHeight;

  float Padding = 10;

  float ButtonXPos = AppWidth * (320 + (i * (ButtonWidth + Padding)))/GUIWidth;
  float ButtonYPos = AppHeight * 955 / GUIHeight;

  rect(ButtonXPos, ButtonYPos, ButtonWidth, ButtonHeight, 3);
}
