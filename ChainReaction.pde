/*
  @author:- Shashank Sahu
*/


int scale=40;
int rows,cols;
Cell grid[][];
int currentPlayer=0;
int clickCount=0;


//This function runs exactly once 
void setup(){
  //Creating a window of size 400*400
  size(400,400);
  rows=width/scale;
  cols=height/scale;
  grid=new Cell[rows][cols];
  for(int i=0;i<rows;i++){
    for(int j=0;j<cols;j++){
      grid[i][j]=new Cell(i,j,scale,-1);
    }
  }
}

void draw(){
  background(51);
   for(int i=0;i<rows;i++){
    for(int j=0;j<cols;j++){
      grid[i][j].show();
    }
  }
}

boolean update(){
  boolean hasUpdated=false;
  for(int i=0;i<rows;i++){
    for(int j=0;j<cols;j++){
      
       if(grid[i][j].num>=grid[i][j].countNeighbour()){
         if(i-1>-1){
           grid[(i-1)][j].num++;
           grid[(i-1)][j].type=grid[i][j].type;
         }
         if(i+1<rows){
           grid[(i+1)][j].num++;
           grid[(i+1)][j].type=grid[i][j].type;
         }
         if(j-1>-1){
           grid[i][j-1].num++;
           grid[i][j-1].type=grid[i][j].type;
         }
         if(j+1<cols){
           grid[i][(j+1)].num++;
           grid[i][j+1].type=grid[i][j].type;
         }
         
         grid[i][j].num=0;
         grid[i][j].type=-1;
         hasUpdated=true;
       }
    }
  }
  return hasUpdated;
}

public void mousePressed(){
  int xc=mouseX;
  int yc=mouseY;
  //println(mouseX+","+mouseY);
  int x=xc/scale;
  int y=yc/scale;
  println(currentPlayer);
  if(x>rows-1||y>cols-1)
    return;
  
  if(grid[x][y].type==-1 || grid[x][y].type==currentPlayer){
    grid[x][y].num++;
    grid[x][y].type=currentPlayer;
    while(update());
    clickCount++;
  }
  currentPlayer=clickCount%2;
  if(isGameOver()){
    while(update());
    draw();
    gameOver();
  }
  
}

boolean isGameOver(){
  int red=0,green=0;
  for(int i=0;i<rows;i++){
    for(int j=0;j<cols;j++){
       if(grid[i][j].type==0)
         green++;
       if(grid[i][j].type==1)
         red++;
    }
  }
  
  if((red>1||green>1) && (red==0||green==0))
    return true;
  else
    return false;
  
}

void gameOver(){
  fill(255);
  textSize(50);
  text("Game Over",width/4,height/3);
  noLoop();
}
