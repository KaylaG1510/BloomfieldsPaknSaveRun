//abstract obstacle class
//extend?? People, Masts, Protestors?
//using total distance or score component?
class Obstacle
{
  PVector pos;
  final float FLOOR = 500;
  
  Obstacle()
  {
    pos = new PVector(300, FLOOR - 40);
  }
  
  void render()
  {
    fill(255, 150, 0);
    noStroke();
    rect(pos.x, pos.y, 50, 40);
  }
}
