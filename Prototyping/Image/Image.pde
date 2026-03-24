/* Aspect Ratio
*/

// Display
fullScreen();
smooth();

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


String FallbackPathway = ImageDirectory + "Bike" + FileExtension;

for (int i = 0; i < ImageName.length; i++) {
  Pathway[i] = sketchPath(ImageDirectory + ImageName[i] + FileExtension);
  Images[i] = loadImage(Pathway[i]);
   
  if (Images[i] == null) {
    Images[i] = loadImage(FallbackPathway);
  }
}

float Random = int(random(0, ImageName.length));

// while() {}

for (int i = 0; i < ImageName.length; i++) {
  float Width = CurrentSongXSize;
  float Height = CurrentSongYSize;
  
  float OriginalW = Images[i].width;
  float OriginalH = Images[i].height;
  
  float scale = min(Width / OriginalW, Height / OriginalH);
  
  println(scale);
  
  float NewWidth = OriginalW * scale;
  float NewHeight = OriginalH * scale;
  
  float XOffset = CurrentSongXPos + (CurrentSongXSize - NewWidth) / 2;
  float YOffset = CurrentSongYPos + (CurrentSongYSize - NewHeight) / 2;
  
  if (Random == i) {
    if (Images[i] != null) {
      image(Images[i], XOffset, YOffset, NewWidth, NewHeight);
    }
  }
}
