class Board {
  int cols, rows;
  float cw, ch;
  
  Board() {cols = 25; rows = 25; cw = width/cols; ch = height/rows;}

  void display() {
    fill(20); stroke(65);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        rect(j*(width/cols), i*(height/rows), cw, ch);
      }
    }
  } 

  void updateFood() {
    fill(255, 0, 0);

    if (food.x == 0 && food.x == 0) {
      food.x = floor(map(random(width), 0, width, 0, cols)); 
      food.y = floor(map(random(width), 0, width, 0, rows));
    }

    rect(food.x*cw, food.y*ch, width/cols, height/rows);
  }


  void updateScore() {
    fill(255);
    textSize(18);
    textAlign(CENTER);
    text("Score:" + str(score), 50, 30);
  }

  void endScreen() {
    delay(150);
    background(20); fill(255); stroke(20);

    textAlign(CENTER); textSize(30);
    text("GAME OVER", width/2, height/2);

    textSize(20);
    text("Your score was: " + str(score), width/2, height - 100);
    text("Hold the space bar to retry", width/2, height - 50);

    if (keyPressed && key == ' ') {
      snakeX.clear(); snakeY.clear();
      snakeX.add(12); snakeY.add(12);
      
      snake.turn(1, 0);

      food.x = 0; food.y = 0;
      score = 0;
      
      gameOver = false;
    }
  }
}
