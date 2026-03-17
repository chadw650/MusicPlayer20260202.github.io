/* Aspect Ratio
*/

// Display
fullScreen();

String upArrow = "..";
String DependenciesFolder = "Dependencies";
String ImagesFolder = "Images";
String ImageName = "Roblox";
String ImageName2 = "Bike";
String FileExtension = ".png";
String open = "/";

// Concatenation

// Absolute Pathway C:\Users\c.wayan3\Documents\GitHub\MusicPlayer20260202.github.io\Dependencies\Images
// Relative Pathway Dependencies\Images

String ImageDirectory = upArrow + open + upArrow + open + DependenciesFolder + open + ImagesFolder + open;
String Pathway = ImageDirectory + ImageName + FileExtension;
String Pathway2 = ImageDirectory + ImageName2 + FileExtension;


PImage Image, Image2;

for (int i = 1; i <=2 ; i++) {
  
}


Image = loadImage(Pathway);
Image2 = loadImage(Pathway2);

image(Image, 10 , 10);
image(Image2, 100, 100);
