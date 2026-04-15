/* Simple Text
*/

// Display
fullScreen();
smooth();

float AppWidth = displayWidth;
float AppHeight = displayHeight;

float GUIWidth = 1920;
float GUIHeight = 1080;

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
  
// Strings
String Title = "Hello";
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
color DarkPurple = #301950;
color ResetInk = White;

fill(Black);
textAlign(CENTER, CENTER);

for (int i = 0; i < labels.length; i++) {
  textFont(Font, FontSizes[i]);
  text(labels[i], targetX[i], targetY[i], targetWidths[i], targetHeights[i]);
}
