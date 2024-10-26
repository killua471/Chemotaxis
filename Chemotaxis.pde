//declare bacteria variables here
int x=50;
int max=100;
int current =0;
int baby =0;
Bacteria []bob = new Bacteria[max];
void setup()
{
  //initialize bacteria variables here
  size(700, 700);
  for (int i =0; i<max; i++) {
    if (i<x) {
      bob[i] = new Bacteria();
    } else {
      bob[i]= null;
    }
  }
}
void draw()
{
  //move and show the bacteria
  background(100);
  x = count();
  for (int i = 0; i<x; i++) {
    if (bob[i] != null) {
      bob[i].show();
      bob[i].walk();
      if (bob[i].alive==true) {
        if (dist(mouseX, mouseY, bob[i].x, bob[i].y)<30) {//make bacteria disappear
          bob[i] = null;
          System.out.println(count());
        }
      }
    }
    // Reproduction check
    if (bob[i] != null && bob[i].alive == true) {
      for (int j = 0; j < max; j++) {
        if (bob[j] != null && bob[j].alive == true) {
          if (bob[j] != null && j != i && dist(bob[j].x, bob[j].y, bob[i].x, bob[i].y) < 20) {
            reproduce(bob[j].x + (int)(Math.random() * 60) - 30, bob[j].y + (int)(Math.random() * 60) - 30);
            break;
          }
        }
      }
    }
  }
}

void reproduce(int onex, int oney) {
  if (x < max) {
    for (int i = 0; i < max; i++) {
      if (bob[i] == null) { // Find an empty slot
        bob[i] = new Bacteria(onex, oney);
        x++; // Increment bacteria count
        System.out.println("Bacteria count: " + count());
        break;
      }
    }
  }
}

public int count() {
  current = 0;
  for (int i=0; i<max; i++) {
    if (bob[i] != null && bob[i].alive==true && current<100) {
      current+=1;
    }
  }
  return current;
}

void mouseClicked() { //makes bacteria come back
  System.out.println(count());
  x=50;
  for (int i = 0; i < max; i++) {
    bob[i] = null;
  }
  for (int i = 0; i < x; i++) {
    bob[i] = new Bacteria();
  }
}

class Bacteria
{
  //lots of java!
  int x, y, myColor;
  boolean alive;
  Bacteria() {
    x= (int)(Math.random()*680);
    y= (int)(Math.random()*680);
    alive = true;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  Bacteria(int myx, int myy) {
    x=myx;
    y=myy;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    alive = true;
  }
  void show() {
    if (alive == true) {
      fill(myColor);
      ellipse(x, y, 30, 30);
    }
  }

  void walk() {
    if (dist(mouseX, mouseY, x, y)<130) {//run away
      if (mouseX>x) {
        x = x+ (int)(Math.random()*5)-4;
      } else {
        x = x+ (int)(Math.random()*5)-1;
      }

      if (mouseY>y) {
        y = y+ (int)(Math.random()*5)-4;
      } else {
        y = y+ (int)(Math.random()*5)-1;
      }//end of run away
    } else {
      x = x+ (int)(Math.random()*5)-2;
      y = y+ (int)(Math.random()*5)-2;
    }
    if (alive==true) {
      if (x<0)
        x=0;
      if (y<0)
        y=0;
      if (x>700)
        x=700;
      if (y>700)
        y=700;
    }
  }
}//end of Bacteria class
