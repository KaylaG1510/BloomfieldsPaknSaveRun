class Player
{
  PImage[] playerFrames;
  int playerFrameIdx;
  PVector position;
  PVector velocity;
  PVector acceleration;
  //don't hardcode playerHeight, setup sprites :(
  
  Player()
  {
    position = new PVector(100, FLOOR - 40);
    velocity = new PVector(1.5, 0);
  }
  
  //show player
  void render()
  {
    fill(0);
    noStroke();
    rect(position.x, position.y, 20, 40);
  }
  
  //move player
  void updatePosition()
  {
    position.add(velocity);
    applyForce(gravity);
    
    //snap position to ground
    if(position.y + 40 >= FLOOR)
    {
      velocity.y = 0;
      position.y = FLOOR - 40;
    }
  }
  
  void applyForce(PVector force)
  {
    velocity.add(force);
  }  
}
