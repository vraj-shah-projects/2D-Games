class Snake {
  PVector vel;

  Snake() {vel = new PVector(1, 0);}
  
  void display() {
    fill(255);

    for (int i = 0; i < snakeX.size(); i++) {
      rect(snakeX.get(i)*board.cw, snakeY.get(i)*board.ch, board.cw, board.ch);
    }
  }

  void move() {
    snakeX.add(0, snakeX.get(0) + int(vel.x)); snakeY.add(0, snakeY.get(0) + int(vel.y));
    
    if (snakeX.get(0) < 0 || snakeX.get(0) > board.cols - 1 || snakeY.get(0) < 0 || snakeY.get(0) > board.rows - 1) {gameOver = true;}
    else if (snakeX.get(0) == food.x && snakeY.get(0) == food.y) {food.x = 0; food.y = 0; score += 1;}
    else {snakeX.remove(snakeX.size() - 1); snakeY.remove(snakeY.size() - 1);}
    
    for (int i = 1; i < snakeX.size(); i++) {
      if (snakeX.get(0) == snakeX.get(i) && snakeY.get(0) == snakeY.get(i)) {gameOver = true;}
    }
  }
  
  void turn(int x, int y) {
    if ((vel.x != 0 && x != 0 && x != vel.x) || (vel.y != 0 && y != 0 && y != vel.y)) {gameOver = true;}
    else {vel.x = x; vel.y = y;}
  }
}

void keyPressed() {
  switch(keyCode) {
    case UP: snake.turn(0, -1); break;
    case DOWN: snake.turn(0, 1); break;
    case LEFT: snake.turn(-1, 0); break;
    case RIGHT: snake.turn(1, 0); break;
  }
}
