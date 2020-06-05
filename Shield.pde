class Shield
{
  PImage n95;
  PVector position;
  
  Shield()
  {
    n95 = loadImage("n95.png");
  }
  
  void render()
  {
    //between 2 diff heights, using ternary operator like in state for menu and game
    //spawn every so often, check flappy bird pipes
    position.x = 350;
    position.y = FLOOR - 50;
    
    image(n95, position.x, position.y);
    //from sketch: s.render(randPosition);
  }
}
