boolean isValid(int[] sudoku)
{
  int[][] grid = makeGrid(sudoku);
  println("Checking validity");
  
  // nur nuller
  boolean nurNuller = true;
  for(int i=0; i<9; i++)
  for(int j=0; j<9; j++)
    if(grid[i][j] != 0)
      nurNuller = false;
  
  if(nurNuller)
    {
      println();
      println("Nur Nuller");
      return false;
    }
    
  // columns
  for(int i=0; i<9; i++)
    if (hasNoDuplicate(grid[i]) == false)
    {
      println();
      println(grid[i]);
      println("Fehler in Spalte "+ i);
      return false;
    }
      
  // rows
  int[] myRow = new int[9];
  
  for(int i=0; i<9; i++)
  {
  for(int j=0; j<9; j++)
    myRow[j] = grid[j][i];
   
   if(hasNoDuplicate(myRow) == false)
   {
      println();
      println(myRow);
      println("Fehler in Reihe "+ i);
      return false;
   }
  }
  
  // Kastln
  
  int[] myKastl = new int[9];
  
  for(int i=0; i<3; i++)
  for(int j=0; j<3; j++)
  {
  for(int ii=0; ii<3; ii++)
  for(int jj=0; jj<3; jj++)
    myKastl[ii*3 + jj] = grid[ii + i*3][jj + j*3];
    
  if(hasNoDuplicate(myKastl) == false)
  {
    println();
    println(myKastl);
    println("Fehler in Kastl " + i + ", " + j);
    return false;
  }
  }
  
  return true;
}




boolean hasNoDuplicate(int[] array)
{
  for(int i=0; i<array.length; i++)
  {
  int current = array[i];
  
  for(int j=0; j<array.length; j++)
     if(current == array[j] && i!=j && array[j] != 0)
     {
       return false;
     }
  }
  
  return true;
}


// Helpers to make a two-dimentional array from one-dimentional array. This is slow (and unnecessary)

void setGrid(int[][] grid, int currentPosition, int value)
{
   grid[floor(currentPosition / 9.0)][currentPosition % 9] = value;
}

int[][] makeGrid(int[] zahlen)
{
 int[][] newGrid = new int[9][9];
 for(int i=0; i<81; i++)
   setGrid(newGrid, i, zahlen[i]);
   
 return newGrid;
}