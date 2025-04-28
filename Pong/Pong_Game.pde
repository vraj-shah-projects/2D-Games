//Pong Game

//starting player scores
int playerAscore = 0;
int playerBscore = 0; 

//declaration of objects
Paddle p1, p2; 
Ball ball;

void setup() {
  //window size and framerate
  size(800, 500);
  frameRate(60);
  
  //create player paddles
  p1 = new Paddle(100, 200, 100, 15);
  p2 = new Paddle(700, 200, 100, 15);
  
  //create ball 
  ball = new Ball(4.5, -4.5, 16);
  
  //set text size
  textSize(20);
}


void draw() {
  //background
  background(20); 
  fill(255); 
  stroke(255);
  
  //update ball position, paddles and score
  update(); 
}


void update() {
  //draw ball
  ball.display();
  
  //update player paddles
  p1.display(); 
  p2.display();
  
  //move the ball and detect for collision 
  ball.moveBall();
   
  //update score
  String score = "Player A Score:" + str(playerAscore) + "       Player B Score:" + str(playerBscore);
  text(score, 222, 40);
}
