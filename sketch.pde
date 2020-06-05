//EXTERNAL RESOURCES
//https://www.youtube.com/watch?v=cXgA1d_E-jY (flappy bird)
//https://www.youtube.com/watch?v=Ouza_4SsbLc (side scroller)
//https://happycoding.io/tutorials/processing/collision-detection
//Version 1.1
import javax.swing.*;

//game states
int state = 0;
final int menu = 0;
final int game = 1;

final color WHITE = color(255);
PImage bg;

//jumping related variables
final PVector gravity = new PVector(0, 0.2);
final PVector jumpForce = new PVector(0, -8);
final float FLOOR = 500;

Player p = new Player();
Obstacle o = new Obstacle();

void setup()
{
  size(800,600);
  bg = loadImage("paknsave.jpg");
  //new StartMenu();
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
         JOptionPane.WARNING_MESSAGE);
         state = state==menu?game:menu;
     }
     else
     {
         //view rules
         //runGame();
     }
   }
}

void runGame()
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
