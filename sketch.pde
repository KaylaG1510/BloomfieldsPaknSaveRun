//EXTERNAL RESOURCES
//https://www.youtube.com/watch?v=cXgA1d_E-jY (flappy bird)
//https://www.youtube.com/watch?v=Ouza_4SsbLc (side scroller)
//https://www.openprocessing.org/sketch/149174
//https://happycoding.io/tutorials/processing/collision-detection??
//Version 1.1
import javax.swing.*;

//game states
int state = 0;
final int menu = 0;
final int game = 1;
Rules r = new Rules();

final int ALPHALEVEL = 20;  //pixels below this alpha level considered transparent
final color WHITE = color(255);
PImage bg;
PImage n95;

//jumping related variables
final PVector gravity = new PVector(0, 0.2);
final PVector jumpForce = new PVector(0, -8);
final float FLOOR = 500;

Player p = new Player();
Obstacle o = new Obstacle();
Shield s;

void setup()
{
  size(800,600);
  bg = loadImage("paknsave.jpg");
  n95 = loadImage("n95.png");
  s = new Shield();
}

void draw()
{
  switch(state)
  {
    case menu:
      showMenu();
      break;
    case game:
      runGame();
      break;
  }
}

void showMenu()
{
  String username = JOptionPane.showInputDialog(
  null,
  "What is your name?",
  "Enter your Name",
  JOptionPane.QUESTION_MESSAGE);
  
  if(username  == null || username.isEmpty())
  {
    JOptionPane.showMessageDialog(
      null,
      "Exiting Program...",
      "Exit Program",
      JOptionPane.WARNING_MESSAGE);
      exit();
  }
  else
  {
    //ask if want to view rules
    //check if ready to start? start button?
    int viewRules = JOptionPane.showConfirmDialog(
     null,
     "Would you like to view the rules " + username + "?",
     "View rules",
     JOptionPane.YES_OPTION);
       
     if(viewRules != JOptionPane.YES_OPTION)
     {
       JOptionPane.showMessageDialog(
         null,
         "Starting game...",
         "Ready to start",
         JOptionPane.PLAIN_MESSAGE);
         //change game state to game
         state = state == menu?game:menu;
     }
     else
     {
       //view rules
       JOptionPane.showMessageDialog(
         null,
         r.getRules(),
         "RULES",
         JOptionPane.PLAIN_MESSAGE);
       
       //change game state to game
       state = state == menu?game:menu;
     }
   }
}

void runGame()
{
  background(bg);
  translate(-p.position.x + 150, 0);
  
  //shield
  image(n95, 400, FLOOR - 50);
  
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
//double jump stop by using onGround
//hit detection
//sprite/animated PImage
//shield
//arraylist objects
//sound
