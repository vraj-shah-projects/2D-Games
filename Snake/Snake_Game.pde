ArrayList<Integer> snakeX = new ArrayList<Integer>();
ArrayList<Integer> snakeY = new ArrayList<Integer>();

PVector food;
int score = 0;

boolean gameOver = false;

Board board;
Snake snake;

void setup() {
  size(800, 800);
  frameRate(12);
  
  background(20);
  
  board = new Board();
  snake = new Snake();
  
  food = new PVector(0, 0);

  snakeX.add(12); snakeY.add(12);
}


void draw() {
  board.display(); 
  board.updateFood(); board.updateScore();
  
  snake.display(); snake.move();

  if (gameOver) {
    board.endScreen();
  }
}
