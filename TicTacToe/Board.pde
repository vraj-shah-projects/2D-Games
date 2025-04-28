//create class for the Board

class Board {
  //grid to map the pieces
  String[][] grid = {{"1", "2", "3"},
                     {"4", "5", "6"},
                     {"7", "8", "9"}};
  
  //rows and columns constructor
  Board(int r, int c) {
    cols = c;
    rows = r;
  }
  
  //display the board
  void display() { 
    background(255);
    fill(255);
    stroke(20);
    
    //create rows*cols number of rectangles for each grid cell
    for (int i = 0; i < cols; i++) {
      for (int j =  0; j < rows; j++) {
        rect(j*(width/cols), i*(height/rows), 200, 200);
      }
    }
  }
  
  //switch the current turn
  void switchCurrentTurn() {
    if (currentTurn == "x") {
      currentTurn = "o";
    } 
    else {
      currentTurn = "x";
    }
  }

  
  void drawShape(int square) {
  //counter variable each time it is looped
  int counter = 0;
  
  //loop through the squares until it find the selected one
  for (int x = 100; x <= 500; x += 200) {
    for (int y = 150; y <= 550; y += 200) {
      counter++;
      //when the selected square matches the counter, draw it on that coordinate
      if (square == counter) {
        text(currentTurn, x, y);
        //switch player turn when shape is placed
        switchCurrentTurn();
        break;
        }
      }
    }
  }
  //check if there is a winner
  void checkForWinner() {
    //since there are the same number of rows as columns, we can use the same loop
    for (int k = 0; k < 3; k++) {
      //check for vertical three in a row 
      if (board.grid[k][0] == board.grid[k][1] && board.grid[k][0] == board.grid[k][2]) {
        winner = board.grid[k][0];
        gameOver = true;
        break;
      }
      //check for horizontal three in a row
      else if (board.grid[0][k] == board.grid[1][k] && board.grid[0][k] == board.grid[2][k]) {
        winner = board.grid[0][k];
        gameOver = true;
        break;
      }
    }
    //check for diagonal three in a row (left to right)
    if (board.grid[0][0] == board.grid[1][1] && board.grid[0][0] == board.grid[2][2]) {
      winner = board.grid[1][1];
      gameOver = true;
    }
    //check for diagonal three in a row (right to left)
    else if (board.grid[2][0] == board.grid[1][1] && board.grid[2][0] == board.grid[0][2]) {
      winner = board.grid[1][1];
      gameOver = true;
    }
    //if there are no more available options left, and there is no winner, it is a tie
    else if (listLength == 0) {
      gameOver = true;
    }
  }
  
  //end screen message for winner or tie
  void endScreen() {
    //change background colour to black
    background(20);
    fill(255);
    textSize(60);
    
    String winnerMessage = winner.toUpperCase() + " WINS!";
    delay(300);
    
    //if the winner was defined as X or O, print the winner message on screen
    if (winner != "") {
      text(winnerMessage, width/2, height/2);
    }
    //otherwise, it is a tie
    else {
      text("IT'S A TIE!", width/2, height/2);
    }
    
    //disallow further use of placing shapes
    fill(20);
    stroke(20);
  }
}
