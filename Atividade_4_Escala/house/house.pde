//posições de centralização 
  int posX=0,posY=0;

 //dimenções do objeto square
  int X1q=30, Y1q=40;
  int X2q=80, Y2q=40;
  int X3q=80, Y3q=75;
  int X4q=30, Y4q=75;
 //dimenções do objeto triangulo
  int X1t=10, Y1t=40;
  int X2t=100,Y2t=40;
  int X3t=55, Y3t=20;
  
 //essa variáveis são globais para falicitar a manipulação pela função de escala

class Square{
  PShape squareShape;
  float posX;
  float posY;
  color colr;
  
  Square(){
    
    posX=0;
    posY=0;
    colr = color(0,0,255);
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+X1q, posY+Y1q);
    squareShape.vertex(posX+X2q, posY+Y2q);
    squareShape.vertex(posX+X3q, posY+Y3q);
    squareShape.vertex(posX+X4q, posY+Y4q);
    
    squareShape.endShape(CLOSE);
  }
  
  
  Square(color c, float posX, float posY){
    colr = c;
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+X1q, posY+Y1q);
    squareShape.vertex(posX+X2q, posY+Y2q);
    squareShape.vertex(posX+X3q, posY+Y3q);
    squareShape.vertex(posX+X4q, posY+Y4q);
    
    squareShape.endShape(CLOSE);
  }
  
  Square(color c, float posX, float posY, int X1q, int Y1q, int X2q, int Y2q, int X3q, int Y3q, int X4q, int Y4q){
    colr = c;
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+X1q, posY+Y1q);
    squareShape.vertex(posX+X2q, posY+Y2q);
    squareShape.vertex(posX+X3q, posY+Y3q);
    squareShape.vertex(posX+X4q, posY+Y4q);
    
    squareShape.endShape(CLOSE);
  }
  
  
  
  void display(){
    
    stroke(0);
    fill(colr);
    shape(squareShape);
    
  }
}


class Triangle{
  
  PShape triangleShape;
  float posX;
  float posY;
  color colr;
  
  Triangle(){
    posX=0;
    posY=0;
    colr = color(0,0,255);
    
    triangleShape = createShape();
    triangleShape.beginShape(TRIANGLES);
    
    triangleShape.vertex(posX+X1t, posY+Y1t);
    triangleShape.vertex(posX+X2t, posY+Y2t);
    triangleShape.vertex(posX+X3t, posY+Y3t);
    
    triangleShape.endShape(CLOSE);
    
  }
  
  Triangle(color c, float posX, float posY){
    colr = c;
    triangleShape = createShape();
    triangleShape.beginShape();
    
    triangleShape.vertex(posX+X1t, posY+Y1t);
    triangleShape.vertex(posX+X2t, posY+Y2t);
    triangleShape.vertex(posX+X3t, posY+Y3t);
    
    triangleShape.endShape(CLOSE);
  }
  
  Triangle(color c, float posX, float posY,int X1t, int Y1t, int X2t, int Y2t, int X3t, int Y3t){
    colr = c;
    triangleShape = createShape();
    triangleShape.beginShape();
    
    triangleShape.vertex(posX+X1t, posY+Y1t);
    triangleShape.vertex(posX+X2t, posY+Y2t);
    triangleShape.vertex(posX+X3t, posY+Y3t);
    
    triangleShape.endShape(CLOSE);
  }
  
  void display(){
    stroke(0);
    fill(colr);
    shape(triangleShape);
  }
  
}

class House{
  Square houseWall;
  Triangle houseRoof;
  color colr;
  
  House(){
    houseWall = new Square(255,posX,posY);
    houseRoof = new Triangle(255,posX,posY);
    colr = color(0, 0, 255);
  }
  
  void display(){
    houseWall.display();
    houseRoof.display();
  }
  
}


 //esse nétodo imcrementa o calculo da matriz de escala já desenvolvido, este método utiliza os pontos das dimenções 
 //e calcula a nova posição deles de acordo com um valor Sx e Sy de escala
 
void escala2(int Sx, int Sy)
   { 
     
//**** calculo da dimenção do objeto quadradro
     //P1
       X1q= Sx*30;
       Y1q= Sy*40;
    //P2
       X2q= Sx*80;
       Y2q= Sy*40;
    //P3
       X3q= Sx*80;
       Y3q= Sy*75;
    //P4
       X4q= Sx*30;
       Y4q= Sy*75;
 
//**** calculo da dimenção do objeto triangulo
 //P1
    X1t= Sx*10;
    Y1t= Sy*40;
 //P2
    X2t= Sx*100;
    Y2t= Sy*40;
 //P3
    X3t= Sx*55;
    Y3t= Sy*20;
    

//mostra a casa com a nova escala
    background(100);
    house = new House();
    house.display(); 

   }
   
   
    
Square square1;
Triangle triangle2;
House house;

int k=1,veri=0;


void setup(){
  
  size(800,600);
  background(100);
  house = new House();
  house.display(); 
  
}



void draw(){
  //fica em loop em aguardo de novas ações
}


//função que capitura o evento de clique do mouse
void mouseClicked() { 
       k++;
       escala2(k,k);   // altera a escala do objeto
}
