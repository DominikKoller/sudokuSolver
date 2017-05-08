boolean solve()
{  
  for(int i=0; i<81; i++)
    if(sudoku[i] == 0)
      {
        println();
        println("STARTING TO SOLVE at "+ i);
        return solveRecursion(i);
      }
   return isValid(sudoku); // already full
}

boolean solveRecursion(int currentPosition)
{
  println();
  println("Recursion at " + currentPosition);
    
    sudoku[currentPosition] ++;
    
    if(sudoku[currentPosition] > 9)
    {
      sudoku[currentPosition] = 0;
      return false;
    }
    
    //Now check if valid
    if(isValid((sudoku)))
    {
      for(int i=currentPosition; i<81; i++)
      {
        if(sudoku[i] == 0)
        {
          if (solveRecursion(i) == true)
            return true;
          
          return solveRecursion(currentPosition);
        }
      }
      return true; // SUDOKU DONE
    }
    
    // THIS NUMBER IS NOT VALID.
    return solveRecursion(currentPosition);
}