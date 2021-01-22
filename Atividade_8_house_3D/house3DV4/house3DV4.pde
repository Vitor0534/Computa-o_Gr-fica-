//Aluno: Vitor de Almeida Silva
//matricula: 20161003305497
//transformação do objeto casa 2D em um objeto casa 3D. refiz o código para um melhor intendimento das funções, utilizei 2 objetos
//PShape o cubo e o triangulo.


PShape cubo;
PShape triangulo;
color cor;
Float posX=0.0;
Float posY=0.0;
int altura = 50;

//dimenções do objeto square
float X1q=30, Y1q=40, z1q=0;
float X2q=80, Y2q=40, z2q=0;
float X3q=80, Y3q=75, z3q=0;
float X4q=30, Y4q=75, z4q=0;

float X5q=30, Y5q=40, z5q=altura;
float X6q=80, Y6q=40, z6q=altura;
float X7q=80, Y7q=75, z7q=altura;
float X8q=30, Y8q=75, z8q=altura;


//a base da piramide sera uma das faces do cubo, de modo que foi expecificado somente a altura com P9t
float X9t= ((X5q-20) + (X2q+20) )/2-5, Y9t =(Y5q + Y2q)/2-50 , z9t=(altura)/2;



void setup() {

  size(800, 600,P3D);
  background(100);
}


void cubo() {
  
  cubo=createShape();

  cubo.beginShape(QUAD);

  //face 1
  cubo.vertex(posX+X1q, posY+Y1q, z1q);
  cubo.vertex(posX+X2q, posY+Y2q, z2q);
  cubo.vertex(posX+X3q, posY+Y3q, z3q);
  cubo.vertex(posX+X4q, posY+Y4q, z4q);

 //face 2
  cubo.vertex(posX+X8q, posY+Y8q, z8q);
  cubo.vertex(posX+X5q, posY+Y5q, z5q);
  cubo.vertex(posX+X1q, posY+Y1q, z1q);
  cubo.vertex(posX+X4q, posY+Y4q, z4q);

//face 3
  cubo.vertex(posX+X3q, posY+Y3q, z3q);
  cubo.vertex(posX+X7q, posY+Y7q, z7q);
  cubo.vertex(posX+X8q, posY+Y8q, z8q);
  cubo.vertex(posX+X4q, posY+Y4q, z4q);

//face 4
  cubo.vertex(posX+X8q, posY+Y8q, z8q);
  cubo.vertex(posX+X5q, posY+Y5q, z5q);
  cubo.vertex(posX+X6q, posY+Y6q, z6q);
  cubo.vertex(posX+X7q, posY+Y7q, z7q);

//face 5
  cubo.vertex(posX+X3q, posY+Y3q, z3q);
  cubo.vertex(posX+X2q, posY+Y2q, z2q);
  cubo.vertex(posX+X6q, posY+Y6q, z6q);
  cubo.vertex(posX+X7q, posY+Y7q, z7q);

//face 6
  cubo.vertex(posX+X6q, posY+Y6q, z6q);
  cubo.vertex(posX+X2q, posY+Y2q, z2q);
  cubo.vertex(posX+X1q, posY+Y1q, z1q);
  cubo.vertex(posX+X5q, posY+Y5q, z5q);

  cubo.endShape();  
  
}

void piramide()
{
  
    triangulo = createShape();
   //desenha triangulo (teto da casa)
  
  
 triangulo.beginShape(QUAD); 
 //Face1 
  triangulo.vertex(posX-20+X1q, posY+Y1q, z1q-20);
  triangulo.vertex(posX+X9t, posY+Y9t, z9t);
  triangulo.vertex(posX+20+X2q, posY+Y2q, z2q-20);
  triangulo.vertex(posX-20+X1q, posY+Y1q, z1q-20);


  //Face2 
  triangulo.vertex(posX+X9t, posY+Y9t, z9t);
  triangulo.vertex(posX-20+X5q, posY+Y5q, z5q+20);
  triangulo.vertex(posX-20+X1q, posY+Y1q, z1q-20);
  triangulo.vertex(posX+X9t, posY+Y9t, z9t);

  //Face3 
  triangulo.vertex(posX+20+X2q, posY+Y2q, z2q-20);
  triangulo.vertex(posX+X9t, posY+Y9t, z9t);
  triangulo.vertex(posX+20+X6q, posY+Y6q, z6q+20);
  triangulo.vertex(posX+20+X2q, posY+Y2q, z2q-20);


  //Face4 
  triangulo.vertex(posX+20+X6q, posY+Y6q, z6q+20);
  triangulo.vertex(posX+X9t, posY+Y9t, z9t);
  triangulo.vertex(posX-20+X5q, posY+Y5q, z5q+20);
  triangulo.vertex(posX+20+X6q, posY+Y6q, z6q+20);

 //Face5 
  triangulo.vertex(posX+20+X2q, posY+Y2q, z2q-20);
  triangulo.vertex(posX-20+X1q, posY+Y1q, z1q-20);
  triangulo.vertex(posX-20+X5q, posY+Y5q, z5q+20);
  triangulo.vertex(posX+20+X6q, posY+Y6q, z6q+20);

 
 triangulo.endShape(); 
}


float angulo=0;
int k=1, veri=0;
int sentido=0;


void draw() 
{
  lights();
  translate(width/2, height/2); 


  //adicionei essa função para uma melhor visualização do objeto
  /*rotate -> Rotaciona o sistema de coordenadas para que as formas sejam desenhadas na tela em angulos*/
  rotateY(map(mouseX, 0, width, 0, PI));    // Rotaciona no eixo Y 
  rotateZ(map(mouseY, 0, height, 0, -PI));  // Rotaciona no eixo Z
  
  cor = color(0,0,255);
  background(100);
  stroke(0);
  fill(255);
  
  //cubo 
  cubo();   
  //priramide
  piramide();
  
  shape(cubo);
  shape(triangulo);
  
}
