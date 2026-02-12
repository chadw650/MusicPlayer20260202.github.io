// Test



void setup() {
  size(1000, 600);
  stroke(2);
  println(displayWidth, displayHeight);
 }
 
void draw() {
  // Left Side
  rect(5, 5, 200, 300, 3); // Home/Settings Container
  rect(10, 10, 190, 30, 3); // Home Button
  rect(10, 45, 190, 30, 3); // Settings Button
  
  rect(5, 310, 200, 280, 3); // Playlist Container
  
  int Playlists = 3;
  
  rect(10, 320, 190, 30, 3); // Playlist Title
  
  for (int i = 1; i <= Playlists; i++) { // Playlists
    int xPos = 10;
    int yPos = 325 + (35*i);
    
    rect(xPos, yPos, 190, 30, 3);
  }
  
  // Middle
  rect(210, 5, 580, 445, 3);  // Container
  rect(220, 10, 180, 30, 3);  // Now Playing:
  
  rect(220, 45, 560, 270, 3); // Currently Playing
  rect(225, 50, 180, 30, 3);  // Song Name
  
  rect(220, 315, 560, 40, 3);  // 2nd in queue
  rect(225, 320, 180, 30, 3);  // Song Name
  
  rect(220, 355, 560, 40, 3);  // 3rd in queue
  rect(225, 360, 180, 30, 3);  // Song Name
  
  rect(220, 395, 560, 40, 3);  // 4th in queue
  rect(225, 400, 180, 30, 3);  // Song Name
  
  // Right Side
  rect(795, 5, 200, 480, 3); // Lyrics
  rect(800, 10, 190, 30, 3); // Lyrics Title
  
  // Progress Bar
  rect(210, 455, 580, 30, 3);
  
  // Button Bar
  rect(210, 490, 785, 100, 3);
  
  for (int i = 1; i <= 11; i++) {
    int Size = 50;
    int Padding = 5;
    
    int xPos = (215-Size) + ((Size + Padding)*i);
    int yPos = 515;
    
    rect(xPos, yPos, Size, Size, 3);
  }
  
  // Volume
  rect(830, 535, 150, 10, 3);
}
