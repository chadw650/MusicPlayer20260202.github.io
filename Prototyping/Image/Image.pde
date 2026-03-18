/* Aspect Ratio
*/

// Display
fullScreen();

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
  image(Images[i], 1, 1);
}
