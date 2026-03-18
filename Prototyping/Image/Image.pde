/* Aspect Ratio
*/

// Display
fullScreen();

float DisplayWidth = displayWidth;
float DisplayHeight = displayHeight;

float GUIWidth = 1920;
float GUIHeight = 1080;

String upArrow = "..";
String DependenciesFolder = "Dependencies";
String ImagesFolder = "Images";
String FileExtension = ".png";
String open = "/";

String[] ImageName = {
  "Roblox",
  "Bike",
};

// Div

float CurrentSongXPos = DisplayWidth * 320/GUIWidth;
float CurrentSongYPos = DisplayHeight * 50/GUIHeight;
  
float CurrentSongXSize = DisplayWidth * 1280/GUIWidth;
float CurrentSongYSize = DisplayHeight * 600/GUIHeight;
  
rect(CurrentSongXPos, CurrentSongYPos, CurrentSongXSize, CurrentSongYSize, 3);

// Concatenation

String ImageDirectory = upArrow + open + upArrow + open + DependenciesFolder + open + ImagesFolder + open;

String[] Pathway = new String[ImageName.length];
PImage[] Images = new PImage[ImageName.length];

for (int i = 0; i < ImageName.length; i++) {
  Pathway[i] = ImageDirectory + ImageName[i] + FileExtension;
  Images[i] = loadImage(Pathway[i]);
}

for (int i = 0; i < ImageName.length; i++) {
  float Width = CurrentSongXSize+1;
  float Height = CurrentSongYSize+1;
  
  if (i == 0) {
    float AspectWidth = 800;
    float AspectHeight = 800;
    
    
  }
  
  image(Images[i], CurrentSongXPos, CurrentSongYPos, Width, Height);
}
