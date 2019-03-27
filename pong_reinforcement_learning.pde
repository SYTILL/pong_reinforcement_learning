boolean gameStart = true;

float speedX, speedY;
int ms = 8; //movement speed of player & enemy
int gray = 128; //color
int ballsize = 20;
int rectsize = 100;
float diamHit;
int keychoice; //STAY-0,UP-1,DOWN-2
int reward; //reward!
int p1=0,p2=0; //points
PVector ball, enemy, player; //contain x,y values

void setup() {
  size(800, 500);
  background(0);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  textSize(40);
  fill(gray);
  reset();
}

void draw() { 
  background(0);
  moveEnemy();
  mouseMove();
  Ball();
  
  //AI FUNCTION COMES HERE
  
  movePlayer();

  status();
}

void status(){
  text(p1+" : "+p2,width/2-35,50); //score board
  if(width < ball.x){ //gameover
    reward = -1;
    p1++; //point++
    reset();
  }else if(ball.x < 0){ //win
    reward = +1;
    p2++; //point++
    reset();
  }
}


void Ball(){ //after bounce, speed increase slightly
  ball.x+=speedX;
  ball.y+=speedY;
  ellipse(ball.x, ball.y, ballsize, ballsize); //draw ball
  if (ball.x>width-40 && ball.x<width-30 && ball.y>player.y-rectsize/2-ballsize/2 && ball.y<player.y+rectsize/2+ballsize/2){// if ball hits player
    speedX = speedX * -1.02; //change dir of ball-x
    speedY = (ball.y-player.y)/5; //change angle of ball
  } else if (ball.x>30 && ball.x<40 && ball.y>enemy.y-rectsize/2-ballsize/2 && ball.y<enemy.y+rectsize/2+ballsize/2){// if ball hits enemy
    speedX = speedX * -1.02; //change dir of ball-x 
  }  
  if (ball.y>height-(ballsize/2) || ball.y<ballsize/2 ){// if ball hits up or down 
    speedY = speedY * -1.02; //change dir of ball-y 
  }
}

void moveEnemy(){
  if(ball.y>enemy.y+20){
    enemy.y+=ms; //move down
  }else if(ball.y<enemy.y-20){
    enemy.y-=ms; //move up
  }
  rect(enemy.x, enemy.y, 10, rectsize); //draw enemy
}

void movePlayer(){
  if(keychoice == 2){
    player.y+=ms; //move down
  }else if(keychoice == 1){
    player.y-=ms; //move up
  }
  rect(player.x, player.y, 10, rectsize); //player
}

void mouseMove(){
  if(mouseY>player.y+20) keychoice = 2; //DOWN
  else if(mouseY<player.y-20) keychoice = 1; //UP
  else keychoice = 0; //STAY
}

void reset(){
  ball = new PVector(150,150);
  enemy = new PVector(25,height/2);
  player = new PVector(width-25,height/2);
  speedX = random(3, 5);
  speedY = random(3, 5);
}
