/* Aspect Ratio
*/

// Display
fullScreen();

float DisplayWidth = displayWidth;
float DisplayHeight = displayHeight;

String upArrow = "..";
String DependenciesFolder = "Dependencies";
String ImagesFolder = "Images";
String FileExtension = ".png";
String open = "/";

String[] ImageName = {
  "Roblox",
  "Bike",
};

// Concatenation

String ImageDirectory = upArrow + open + upArrow + open + DependenciesFolder + open + ImagesFolder + open;

String[] Pathway = new String[ImageName.length];
PImage[] Images = new PImage[ImageName.length];

for (int i = 0; i < ImageName.length; i++) {
  Pathway[i] = ImageDirectory + ImageName[i] + FileExtension;
  Images[i] = loadImage(Pathway[i]);
}

for (int i = 0; i < ImageName.length; i++) {
  float X = random(0, DisplayWidth);
  float Y = random(0, DisplayHeight/2);
  
  image(Images[i], X, Y);
}
