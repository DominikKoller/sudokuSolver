boolean isDone = false;
int[] sudoku;

void setup() {
  size(800,400);
  textSize(20);
  sudoku = new int[81];
  
  //startStructured(77);
  startRandom(5);
  
  scale(0.8);
  drawGrid();
  
  translate(480,0);
  
  boolean solved = solve();

  
  drawGrid();
  
  println();
  println("in setup, isValid: "+isValid(sudoku));
  
}

void draw(){
  
}


void drawGrid(){
  int[][] grid = makeGrid(sudoku);
  pushStyle();
  for(int i=0; i<9; i++)
  {
    for(int j=0; j<9; j++)
    {
      fill(255);
      if(grid[i][j] == 0)
      fill(255, 200,200);
      rect(10 + 50*i, 10 +50*j, 50, 50);
      fill(0);
      if(grid[i][j] != 0)
        text(grid[i][j] +"", 25+ 10 + 50*i, 25+ 10 +50*j, 50, 50);
    }
  }
  popStyle();
}

void startRandom(int anzahl)
{
  sudoku = new int[81];
  for(int i=0; i<anzahl; i++)
  {
    int position = 0;    
    
    while(sudoku[position] != 0)
      position = floor(random(81));
    
    for(int j=0; j<9; j++)
    {
      sudoku[position] = j+1;
      if(isValid(sudoku))
        break;
    }
      
    if(isValid(sudoku) == false)
    {
     println();
     println("generated invalid sudoku");
     startRandom(anzahl);
     return;
    }
  }
  
}

void startStructured(int anzahl)
{
  int[] myList = { 
    1,2,3,4,5,6,7,8,9,
    4,5,6,7,8,9,1,2,3,
    7,8,9,1,2,3,4,5,6,
    
    2,3,4,5,6,7,8,9,1,
    5,6,7,8,9,1,2,3,4,
    8,9,1,2,3,4,5,6,7,
    
    3,4,5,6,7,8,9,1,2,
    6,7,8,9,1,2,3,4,5,
    9,1,2,3,4,5,6,7,8} ;
    
  for(int i=0; i<anzahl; i++)
    myList[floor(random(81))] = 0;
    
  sudoku = myList;  
}