class Cell{
  int x;
  int y;
  int size;
  int num;
  int type;
  public Cell(int x,int y,int size,int type){
    this.x=x;
    this.y=y;
    this.num=0;
    this.size=size;
    this.type=type;
  }
  
  int countNeighbour(){
      int c=0;
      if(x-1>-1)
         c++;
      if(x+1<rows)
         c++;
      if(y-1>-1)
        c++;
      if(y+1<cols)
         c++;
       return c;
  }
 
  void show(){ 
      strokeWeight(1);
      if(currentPlayer==0){
        stroke(0,255,0);
      }
      else{
        stroke(255,0,0);
      }
      
     noFill();
     textSize(size/2);
     rect(x*size,y*size,size,size);
     if(num>0){
       if(type==0)
         {
           fill(0,255,0);
         }
       if(type==1){
         fill(255,0,0);
       }
       text(num+"",x*size+size/2-5,y*size+size/2);
     }
  }
}
