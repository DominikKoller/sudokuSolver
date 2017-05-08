class Solver
{
 List<Integer> myList = new ArrayList();
 public List<int[]> solutions = new ArrayList();
 
 public Solver(int[] sudoku)
 {
   for(int i=0; i<81; i++)
    if(sudoku[i] == 0)
      {
        println();
        println("Starting index "+ i);
        myList.add(i);
        break;
      }   
 }
 
 public void step() //<>//
 {
   if(myList.isEmpty())
     return;
     
   sudoku[myList.get(0)] ++;
   int temp = myList.get(0);
   
   if(sudoku[myList.get(0)] > 9)
    {
      sudoku[myList.get(0)] = 0;
      myList.remove(0);
      return;
    }
    
    //Now check if valid
  
    if(isValid((sudoku)))
    {
      boolean newSolution = true;
      for(int i=myList.get(0); i<81; i++)
        if(sudoku[i] == 0)
        {
          newSolution = false;
          myList.add(0, i);
          break;
        }
       if(newSolution)
         solutions.add(sudoku.clone());
    }
 }
}