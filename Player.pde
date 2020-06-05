class Player
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  //don't hardcode playerHeight, setup sprites :(
  
  Player()
  {
    position = new PVector(100, FLOOR - 40);
    velocity = new PVector(2, 0);
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
