//Tic Tac Toe Game

//variables to check if game is over / which player's move it is
String currentTurn = "x";
String winner = "";
boolean gameOver = false;

//columns and rows on tic tac toe board
int cols = 3;
int rows = 3;

//defining mouse coordinate variables
float xpos, ypos;

//defining board
Board board;
           
//variables for tracking the squares available
IntList coordinates;
int listLength;

void setup() {
  //window
  size(600, 600);
  
  //create board object
  board = new Board(cols, rows);
  
  //draw board
  board.display();
  
  //create intlist for possible moves
  coordinates = new IntList(1, 2, 3, 4, 5, 6, 7, 8, 9);
  
  //set text settings to write moves
  fill(20);
  textSize(150);
  textAlign(CENTER);
}

void draw() {
  //mouse position
  xpos = mouseX;
  ypos = mouseY;
  
  //updating listlength
  listLength = coordinates.size();
  
  //check for winner
  board.checkForWinner();
  
  //take game to end screen if game is over
  if (gameOver) {
    board.endScreen();
  }
}

//in the event that the mouse is clicked
void mouseClicked() { 
  //declare variables to map the x and y coordinates where the mouse was clicked
  int squareX = floor(map(xpos, 0, width, 0, cols));
  int squareY = floor(map(ypos, 0, height, 0, rows));
  
  //counter variable for each loop
  int squareNumber = 0;
  
  //loop through columns and rows of board
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows; y++) {
      squareNumber++;
      
      //check if mouse position matches selected square
      if (squareX == x && squareY == y) {
        
        //loop through available squares list
        for (int listIndex = 0; listIndex < listLength; listIndex++) {
          
          //if the square is free, then draw the shape based on the current loop
          if (squareNumber == coordinates.get(listIndex)) {
            board.grid[squareX][squareY] = currentTurn;
            board.drawShape(squareNumber);
            
            //remove the square from the available options
            coordinates.remove(listIndex);
            break;
          }
        }
      }
    }
  }
}
