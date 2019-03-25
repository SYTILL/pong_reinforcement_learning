boolean gameStart = true;

float x = 150; //pos of ball-x
float y = 150; //pos of ball-y
float speedX = random(3, 5);
float speedY = random(3, 5);
int gray = 128; //color
int ballsize = 20;
int rectsize = 150;
float diamHit;


void setup() {
  size(500, 500);
  background(0);
  noStroke();
  ellipseMode(CENTER);
  fill(gray);
}

void draw() { 
  background(0);
  ellipse(x, y, ballsize, ballsize);
  rect(20, 0, 10, rectsize);
  rect(width-30, mouseY-rectsize/2, 10, rectsize);


  if (gameStart) {
    moveBall();
    // resets things if you lose
    if (x > width) { 
      gameStart = true;
      x = 150;
      y = 150; 
      speedX = random(3, 5);
      speedY = random(3, 5);
    }
  }
}

void moveBall(){
  x = x + speedX;
  y = y + speedY;
  if (x>width-40 && x<width-30 && y>mouseY-rectsize/2 && y<mouseY+rectsize/2){// if ball hits player
    speedX = speedX * -1; //change dir of ball-x
  }
  else if (x<40){// if ball hits enemy
    speedX = speedX * -1.1; //change dir of ball-x & increase speed
  }  
  if ( y>height || y<0){// if ball hits up or down 
    speedY = speedY * -1; //change dir of ball-y 
  }
}
