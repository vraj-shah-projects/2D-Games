//create class for ball

class Ball {
  //define ball speed
  PVector vel; 
  
  //define ball coordinates
  PVector pos;
  
  //define ball size
  float circleSize;
  
  //constructor
  Ball(float x, float y, float s) {
    //set velocities to constructor parameters
    vel = new PVector(x, y);
    
    //set ball to center of screen
    pos = new PVector(width/2, height/2);
    
    //set ball size
    circleSize = s;
  }
  
  void display() {
    //draw ball
    ellipse(pos.x, pos.y, circleSize, circleSize);
  }
  
  void moveBall() {
    //move ball 
    pos.add(vel); 
    
    //change ball x direction if it has collided with Paddle A
    if ((pos.x < (p1.paddle_x + p1.paddle_width) && (pos.x > p1.paddle_x) && (pos.y < (p1.paddle_y + p1.paddle_height)) && (pos.y > p1.paddle_y))) {
      vel.x *= -1; 
    } 
    
    //change ball x direction if it has collided with paddle B
    else if ((pos.x > p2.paddle_x) && (pos.x < (p2.paddle_x + p2.paddle_width)) && (pos.y < (p2.paddle_y + p2.paddle_height)) && (pos.y > p2.paddle_y)) {
      vel.x *= -1; 
    }
    
    
    //bounce ball if it hits top or bottom of screen
    else if (pos.y > (height - circleSize/2) || pos.y < circleSize/2) {
      vel.y *= -1; 
    }
    
    //reset ball coordinates if out of screen, check if player A or B's point to update score
    else if (pos.x > width) {
      pos.x = width/2; 
      pos.y = height/2;
      vel.x *= -1;
      playerAscore += 1;
    }
    
    else if (pos.x < 0) {
      pos.x = width/2; 
      pos.y = height/2;
      vel.x *= -1;
      playerBscore += 1;
    }
  }
}
