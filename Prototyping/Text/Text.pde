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

// Fonts
println("Start of Console");
String FontList[] = PFont.list();

float FontSize = 30;
PFont Font;
String LeelawadeeUIBold = "Leelawadee UI Bold";

Font = createFont(LeelawadeeUIBold, FontSize);

// Drawing Text
color White = #FFFFFFFF;
color Black = #030000;
color DarkPurple = #301950;
color ResetInk = White;

fill(Black);
textFont(Font);
text(Title, CurrentSongTextXPos, CurrentSongTextYPos, CurrentSongTextXSize, CurrentSongTextYSize);
