//Aluno: Vitor de Almeida Silva
//O código em anexo define um objeto casa em 2D. Altere o mesmo incrementando uma matriz de 
//transformação de rotação, e aplicando-a a cada clique do mouse (45 graus).


//posições de centralização 
  int posX=400,posY=300;

 //dimenções do objeto square
  float X1q=30, Y1q=40;
  float X2q=80, Y2q=40;
  float X3q=80, Y3q=75;
  float X4q=30, Y4q=75;
 //dimenções do objeto triangulo
  float X1t=10, Y1t=40;
  float X2t=100,Y2t=40;
  float X3t=55, Y3t=20;
  
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

   //essa função realiza a rotação do objeto baseado na matriz de rotação
   //é realizado o calculo da nova posição de cada vertice do objeto
   void rotation(float angulo)
   {
     
        angulo=radians(angulo);
 //**** calculo da rotação do objeto quadradro
 //P1
       X1q= 30 * cos(angulo) - 40 * sin(angulo);
       Y1q= 40 * cos(angulo) + 30 * sin(angulo);
 //P2
       X2q= 80 * cos(angulo) - 40 * sin(angulo);
       Y2q= 40 * cos(angulo) + 80 * sin(angulo);
 //P3
       X3q= 80 * cos(angulo) - 75 * sin(angulo);
       Y3q= 75 * cos(angulo) + 80 * sin(angulo);
 //P4
       X4q= 30 * cos(angulo) - 75 * sin(angulo);
       Y4q= 75* cos(angulo)  + 30 * sin(angulo);
 
//**** calculo da rotação do objeto triangulo
 //P1
       X1t= 10 * cos(angulo) - 40 * sin(angulo);
       Y1t= 40 * cos(angulo) + 10* sin(angulo);
 //P2
       X2t= 100 * cos(angulo) - 40 * sin(angulo);
       Y2t= 40 * cos(angulo) + 100 * sin(angulo);
 //P3
       X3t= 55 * cos(angulo) - 20 * sin(angulo);
       Y3t= 20 * cos(angulo) + 55 * sin(angulo);
 
 //mostrando a casa com cordenadas atualizadas
     background(100);
     house = new House();
     house.display();  
     
   }
   
    
Square square1;
Triangle triangle2;
House house;
float angulo=0;

int k=1,veri=0;


void setup(){
  
  size(800,600);
  background(100);
  house = new House();
  house.display();  
  
}



void draw(){




       
}


//função que capitura o evento de clique do mouse
void mouseClicked() {
  angulo+=45;
  rotation(angulo);
}
