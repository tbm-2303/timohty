import java.util.Random;

class Game
{
  private Random rnd; // noget med random at gøre
  private final int width; //brede
  private final int height; // højde 
  private int[][] board; // 2d array ved navn board
  private Keys keys; // keys objekt ved navn keys
  private int playerLife; // integer ved navn playerlife
  private int playerLife1;
  private Dot player; // dot-objekt ved navn player
  private Dot player1;
  private Dot[] enemies; // array af dot objekter ved navn enemies
  private Dot[] mad; // dot objekt ved navn mad. 
  //public boolean gameOver;
  
  
   
  Game(int width, int height, int numberOfEnemies, int madAntal)
  {
   /* if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    */
    
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0,0,width-1, height-1);
    player1 = new Dot(0,0,width-1, height-1);
    mad = new Dot[madAntal];
    enemies = new Dot[numberOfEnemies];
    this.playerLife = 100;
    this.playerLife1 = 100;
    //boolean gameOver = false;
    
    
    
    for(int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
  
    for(int n = 0; n < madAntal; ++n)
    {
      mad[n] = new Dot(round(random(0,width-1)),round(random(0,height-1)), width-1, height-1);}
    }
  
  
  public int getWidth()
  {
    return width;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getPlayerLife()
  {
    if(playerLife > 0)
    {
    return playerLife;
    }
    else
    {
      return 0;
    }
  }
  
  public int getPlayerLife1()
  {
    return playerLife1;
  }
  
  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }
  
  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }
  
  
   public void onKeyPressed(int code)
  {
    keys.onKeyPressed_1(code);
  }
  
  public void onKeyReleased(int code)
  {
    keys.onKeyReleased_1(code);
  }
  
  
  
  public void update()
  {
    updatePlayer();
    updatePlayer1();
    updateEnemies();
    updateFood();
    checkForCollisions();
    checkForCollisions1();
    checkForCollisions2();
    checkForCollisions3();
    clearBoard();
    populateBoard();
  }
  

  
  
  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
    
  }
  
  private void clearBoard()
  {
    for(int y = 0; y < height; ++y)
    {
      for(int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
  
  private void updatePlayer()
  {
    //Update player
    if(keys.wDown() && !keys.sDown())
    {
      player.moveUp(); 
    }
    if(keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if(keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if(keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }  
  }
  
  private void updatePlayer1()
  {
    if(keys.o_Down() && !keys.n_Down())
    { 
    player1.moveUp();
    }
    if(keys.v_Down() && !keys.h_Down())
    {
      player1.moveLeft();
    }
    if(keys.n_Down() && !keys.o_Down())
    {
      player1.moveDown();
    }
    if(keys.h_Down() && !keys.v_Down())
    {
      player1.moveRight();
    }
  }
  private void updateFood()
  {
    for(int i = 0; i < mad.length; i++)
    {
      int dx_2 = player.getX() - mad[i].getX();
      int dy_2 = player.getY() - mad[i].getY();
 
      int dx_3 = player1.getX() - mad[i].getX();
      int dy_3 = player1.getY() - mad[i].getY();
      int sum2 = abs(dx_2)+abs(dy_2);
      int sum3 = abs(dx_3)+abs(dy_3);
      
     if(sum2 < sum3)  
        {
      if(abs(dx_2) > abs(dy_2))  
          {
          if(dx_2 > 0)   
          {
            mad[i].moveLeft();
          }
          else
          {
            //Player is to the left
            mad[i].moveRight();
          }
          }
          else if(dy_2 > 0)
          {
          //Player is down;
          mad[i].moveUp();
          }
          else
          { 
          //Player is up;
          mad[i].moveDown();
          }
        }
        if (sum2 > sum3)
        {
          if(abs(dx_3) > abs(dy_3))  
          {
          if(dx_3 > 0)   
          {
            mad[i].moveLeft();
          }
          else
          {
            //Player is to the left
            mad[i].moveRight();
          }
          }
          else if(dy_3 > 0)
          {
          //Player is down;
          mad[i].moveUp();
          }
          else
          { 
          //Player is up;
          mad[i].moveDown();
          }
      }
    }    
    
  }

  private void updateEnemies()
  {
    for(int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(4) < 3)
      {
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        
        int dx_1 = player1.getX() - enemies[i].getX();
        int dy_1 = player1.getY() - enemies[i].getY();
        int sum = abs(dx)+abs(dy);
        int sum1 = abs(dx_1)+abs(dy_1); //very smart timmy. i like :)
        
        if(sum < sum1)  
        {
          if(abs(dx) > abs(dy))  
          {
          if(dx > 0)   
          {
            enemies[i].moveRight();
          }
          else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
          }
          else if(dy > 0)
          {
          //Player is down;
          enemies[i].moveDown();
          }
          else
          { 
          //Player is up;
          enemies[i].moveUp();
          }
        }
        
        
        if (sum > sum1)
        {
          if(abs(dx_1) > abs(dy_1))  
          {
          if(dx_1 > 0)   
          {
            enemies[i].moveRight();
          }
          else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
          }
          else if(dy_1 > 0)
          {
          //Player is down;
          enemies[i].moveDown();
          }
          else
          { 
          //Player is up;
          enemies[i].moveUp();
          }
       }
    }
   }
  }
 
  private void populateBoard()
  {
    if(playerLife > 0)
    {
      
    //Insert player
    board[player.getX()][player.getY()] = 1;
    board[player1.getX()][player1.getY()] = 3;
    
    //insert mad mad kan have sin egen værdi i arrayet
    for(int n = 0; n < mad.length; n++)
    {
    board[mad[n].getX()][mad[n].getY()] = 4;
    }
    //Insert enemies
    for(int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    }
    else
    {
      noLoop();
    }
  }
   
  private void checkForCollisions()
  {
    //Check enemy collisions with player
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision
        --playerLife;
      }
    }
  }
 
   private void checkForCollisions1()
  {
    //Check enemy collisions with player1
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player1.getX() && enemies[i].getY() == player1.getY())
      {
        //We have a collision
        --playerLife1;
      }
    }
  }
 
  private void checkForCollisions2()
  {
    //Check player collisions with food
    for(int i = 0; i < mad.length; ++i)
    {
      if(mad[i].getX() == player.getX() && mad[i].getY() == player.getY())
      {
        //We have a collision
       playerLife += 3;
       mad[i].x = round(random(0,width-1));
       mad[i].y = round(random(0,height-1));
      }
    }
  }
  
   private void checkForCollisions3()
  {
    //Check player1 collisions with food
    for(int i = 0; i < mad.length; ++i)
    {
      if(mad[i].getX() == player1.getX() && mad[i].getY() == player1.getY())
      {
        //We have a collision
        playerLife1 += 3;   
        mad[i].x = round(random(0,width-1));
        mad[i].y = round(random(0,height-1));
      }
    }
  }
}
