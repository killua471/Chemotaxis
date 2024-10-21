//declare bacteria variables here   
int x=50;
Bacteria []bob = new Bacteria[x];
void setup()   
{     
  //initialize bacteria variables here   
  size(700, 700);
  for (int i =0; i<bob.length; i++) {
    bob[i] = new Bacteria();
  }
}   
void draw()   
{    
  //move and show the bacteria   
  background(100);
  for (int i = 0; i<bob.length; i++) {
    bob[i].show();
    bob[i].walk();
    if (dist(mouseX, mouseY, bob[i].x, bob[i].y)<30) {//make bacteria disappear
      bob[i].alive = false;
    }
  }
}  

void mouseClicked(){ //makes bacteria come back
  for (int i = 0; i<bob.length; i++) {
    bob[i].show();
    bob[i].walk();
    bob[i].x= (int)(Math.random()*680);
    bob[i].y= (int)(Math.random()*680);
    bob[i].alive=true;
  }
}

class Bacteria    
{     
  //lots of java!   
  int x, y, myColor;
  boolean alive = true;
  Bacteria() {
    x= (int)(Math.random()*680);
    y= (int)(Math.random()*680);
    alive = true;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }

  void show() {
    if(alive == true){
    fill(myColor);
    ellipse(x, y, 30, 30);
    }
  }

  void walk() {
    if (dist(mouseX, mouseY, x, y)<130) {//run away
      if (mouseX>x) {
        x = x+ (int)(Math.random()*5)-3;
      } else {
        x = x+ (int)(Math.random()*5)-1;
      }

      if (mouseY>y) {
        y = y+ (int)(Math.random()*5)-3;
      } else {
        y = y+ (int)(Math.random()*5)-1;
      }//end of run away
    } else {
      x = x+ (int)(Math.random()*5)-2;
      y = y+ (int)(Math.random()*5)-2;
    }
    
    if(x<0)
      x=0;
    if(y<0)
      y=0;
    if(x>700)
      x=700;
    if(y>700)
      y=700;
  }
}//end of Bacteria class
