//create class for paddle 

class Paddle {
  //define paddle coordinates and dimensions
  float paddle_x, paddle_y; 
  float paddle_height, paddle_width;  
  //constructor
  Paddle(float x, float y, float h, float w) {
    //set paddle coordinates and dimensions
    paddle_x = x; 
    paddle_y = y;
    paddle_height = h;
    paddle_width = w;
  }
  
  void display() {
    //draw paddle
    rect(paddle_x, paddle_y, paddle_width, paddle_height);
  }
  
  void movePaddle(int direction) {
    //if paddle touches top, only allow downward movement
    if (paddle_y == 0) {
      if (direction == -1) {
        paddle_y += 40;
      }
    }
    //if paddle touches bottom, only allow upward movement
    else if (paddle_y == height - paddle_height) {
      if (direction == 1) {
        paddle_y -= 40;
      }
    }
    //move paddle (up or down) depending on direction argument
    else {
      paddle_y += direction * -40;
    }
  }
}


void keyPressed() {
  //check for keys pressed and execute movement
  switch(keyCode) {
    case 'W' : p1.movePaddle(1); break; 
    case 'S' : p1.movePaddle(-1); break; 
    case UP : p2.movePaddle(1); break; 
    case DOWN : p2.movePaddle(-1); break;
  }
}
