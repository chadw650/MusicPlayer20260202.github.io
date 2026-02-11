// Test

void setup() {
  
  size(1000, 600);
  stroke(2);
 
 }
 
void draw() {
  // Left Side
  rect(5, 5, 200, 300, 3);
  rect(5, 310, 200, 280, 3);
  
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
  
  // Progress Bar
  rect(210, 455, 580, 30, 3);
  
  // Button Bar
  rect(210, 490, 785, 100, 3);
  
  for (int i = 1; i <= 11; i++) {
    int Size = 60;
    int Padding = 7;
    
    int xPos = (215-Size) + ((Size + Padding)*i);
    int yPos = 510;
    
    rect(xPos, yPos, Size, Size);
  }
  
}
