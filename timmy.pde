/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
 
import java.util.Random;

Game nytspil = new Game(30,20,4,3);
Game nytspil1 = new Game(30,20,4,3);


PFont font;
public void settings() {
  size(1201, 801);
}

void setup()
{
  frameRate(10);
  font = createFont("Arial", 16, true);
  textFont(font, 16);
}

void keyReleased()
{
  nytspil.onKeyReleased(key);
  nytspil.onKeyReleased(keyCode);
}

void keyPressed()
{
  nytspil.onKeyPressed(key);
  nytspil.onKeyPressed(keyCode);
}



void draw()
{ 
  nytspil.update();
  background(0); //Black
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  
  
  int[][] board = nytspil.getBoard();
  
  for (int y = 0; y < nytspil.getHeight(); y++)
  {
    for (int x = 0; x < nytspil.getWidth(); x++)
    {
      if(board[x][y] == 0)
      {
        fill(0,0,0);   // sorte firkanter
      }
      else if(board[x][y] == 1)
      {
        fill(0,0,255);   //   player er blå
      }
      else if(board[x][y] == 2)
      {
        fill(255,0,0);   // enemies er rød
      }
      else if(board[x][y] == 3)
      {
        fill(0,255,0);  // player1 er grøn
      }
      else if(board[x][y] == 4)
      {
        fill(255,255,0,200); // mad er gul
      }
      stroke(100,100,100);
      rect(x*40, y*40, 40, 40);
    }
  }
  fill(0,0,255);
  text("Life: "+nytspil.getPlayerLife(), 25,25);
  fill(0,255,0);
  text("Life: "+nytspil.getPlayerLife1(), 1100,25);
  
}
