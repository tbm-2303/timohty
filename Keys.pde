class Keys
{
  
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  
 
  private boolean o_Down = false;
  private boolean v_Down = false;
  private boolean n_Down = false;
  private boolean h_Down = false;
  
  //public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  public boolean aDown()
  {
    return aDown;
  }
  public boolean sDown()
  {
    return sDown;
  }
  public boolean dDown()
  {
    return dDown;
  }
  
  
  
  public boolean o_Down()
  {
    return o_Down;
  }
  public boolean v_Down()
  {
    return v_Down;
  }
  public boolean n_Down()
  {
    return n_Down;
  }
  public boolean h_Down()
  {
    return h_Down;
  }
  
  
  void onKeyPressed(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = true;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = true;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
  }
  
  void onKeyReleased(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = false;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = false;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = false;
    }
  }
  
  
  
   void onKeyPressed_1(int code)
  {
    if(code == UP)
    {
      o_Down = true;
    }
    else if (code == LEFT)
    {
      v_Down = true;
    }
    else if(code == DOWN)
    {
      n_Down = true;
    }
    else if(code == RIGHT)
    {
      h_Down = true;
    }
  }
  
  void onKeyReleased_1(int code)
  {
    if(code == UP)
    {
      o_Down = false;
    }
    else if (code == LEFT)
    {
      v_Down = false;
    }
    else if(code == DOWN)
    {
      n_Down = false;
    }
    else if(code == RIGHT)
    {
      h_Down = false;
    }
  }
  
}
  
  
  
