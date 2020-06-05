//RESOURCES
//outside of lectures and labs
//https://www.youtube.com/watch?v=cXgA1d_E-jY (flappy bird)
//https://www.youtube.com/watch?v=Ouza_4SsbLc (side scroller)
//https://happycoding.io/tutorials/processing/collision-detection
//Version 1.1

final color WHITE = color(255);
PImage bg;  //background image
final PVector gravity = new PVector(0, 0.2);
final PVector jumpForce = new PVector(0, -8);
final float FLOOR = 500;

Player p = new Player();
Obstacle o = new Obstacle();

void setup()
{
  size(800,600);
  bg = loadImage("paknsave.jpg");
}

void draw()
{
  background(bg);
  translate(-p.position.x + 150, 0);
  
  //show object
  o.render();
  
  //render player and update position
  p.render();
  p.updatePosition();
}

void keyReleased()
{
 if(key == ' ')
 {
   p.applyForce(jumpForce);
   println("space applying jump");
   println("keyReleased(): key=" + int(key) + ", keyCode=" + keyCode);
 }
}

//main menu tab and rules tab
//hit detection
//sprite
//shield
//arraylist objects
