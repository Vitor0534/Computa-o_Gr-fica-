//Aluno: Vitor de Almeida Silva
//matricula: 20161003305497

// este código implementa:
//   *cisalhamento 3D inclinando x ao crescer y;
//   *reflexão 3D nos eixos yz, xz e zy;
//   *Escala 3D com fator de escala ajustável;
//   *Rotação 3D em torno do eixo y.

// OBS:Para executar as transformações, basta clicar com o botão direito do mouse sucessivas vezes, o promp irá indicar as transformações

// tanto o cubo quanto a piramide foram desenhados vertice a vertice.
// As dimenções dos objetos foram baseadas no codigo "house 2D"

int transform=0;
//função que capitura o evento de clique do mouse
void mouseClicked() {

  if (transform<6) {
    rotation2(45);    //Rotação
    transform++;
  } else {
    if (transform>=6 && transform<10)
    {
      reflexao2(veri);  //Reflexão
      transform++;
    } else {
      if (transform>=10 && transform<11)
      {
        escala3(2, 2, 2);   //Escala
        transform++;
      } else {
        if (transform>=11 && transform<15)
        {
          cisalhamento2(2); //Cisalhamento
          transform++;
        } else {
          geraObj();
          transform=0;
        }
      }
    }
  }
}

void geraObj()
{
          //cubo
          cubo2();
          //priramide
          piramide();

          stroke(0);
          fill(255);
          shape(cubo);
          shape(triangulo);
}


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

float X9t= ((X5q-20) + (X2q+20) )/2-5, Y9t =(Y5q + Y2q)/2-50, z9t=(altura)/2;

//dimenções do objeto triangulo

float X1t=10, Y1t=40, z1t=0;
float X2t=100, Y2t=40, z2t=0;
float X3t=55, Y3t=20, z3t=0;

void setup() {

  size(800, 600, P3D);
  background(100);

  cor = color(0, 0, 255);
  background(100);
  lights();
  translate(width/2, height/2);

  //cubo
  cubo2();
  //priramide
  piramide();

  stroke(0);
  fill(255);
  shape(cubo);
  shape(triangulo);
}


//o método cubo2() cria um cubo baseado nas dimenções das paredes da house 2D
void cubo2() {

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

//o método piramide() cria uma pirâmide com base nas dimenções do teto da house 2D
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



//essa função implementa a matriz de reflexão 3D nos três eixos yz, xz e xy
void reflexao2(int sentido)
{ 

  PVector p;
  Float x, y, z;

  if (sentido==0)//reflexão em yz
  {
    System.out.println("Reflexão yz");

    for (int i=0; i<cubo.getVertexCount(); i++)
    {
      p=cubo.getVertex(i);
      x=p.x;
      p.x = -x;
      cubo.setVertex(i, p.x, p.y, p.z);

      //System.out.println("i= " +i+ " P(" +p.x+","+p.y+","+p.z+")");

      if (i<triangulo.getVertexCount())
      {
        p=triangulo.getVertex(i);
        x=p.x;
        p.x = -x;
        triangulo.setVertex(i, p.x, p.y, p.z);
      }
    }
    veri=1;
  } else {
    if (sentido==1) //relexão em xz
    {
      System.out.println("Reflexão xz");

      for (int i=0; i<cubo.getVertexCount(); i++)
      {
        p=cubo.getVertex(i);
        //x=p.x;
        y=p.y;
        p.y = -y;
        cubo.setVertex(i, p.x, p.y, p.z);

        // System.out.println("i= " +i+ " P(" +p.x+","+p.y+","+p.z+")");

        if (i<triangulo.getVertexCount())
        {
          p=triangulo.getVertex(i);
          //x=p.x;
          y=p.y;
          p.y = -y;
          triangulo.setVertex(i, p.x, p.y, p.z);
        }
      }

      veri=2;
    } else { 

      System.out.println("Reflexão xy");
      //reflexão xy;
      for (int i=0; i<cubo.getVertexCount(); i++)
      {
        p=cubo.getVertex(i);
        //x=p.x;
        //y=p.y;
        z=p.z;
        p.z = -z;
        cubo.setVertex(i, p.x, p.y, p.z);

        // System.out.println("i= " +i+ " P(" +p.x+","+p.y+","+p.z+")");

        if (i<triangulo.getVertexCount())
        {
          p=triangulo.getVertex(i);
          //x=p.x;
          //y=p.y;
          z=p.z;
          p.z = -z;
          triangulo.setVertex(i, p.x, p.y, p.z);
        }
      }

      veri=0;
    }
  }


  background(100);
  shape(cubo);
  shape(triangulo);
}  



//Essa função implementa a matriz de cisalhamento inclinando x ao crescer y
void cisalhamento2(float a)
{ 
  System.out.println("Cisalhamento --- a="+a);

  for (int i=0; i<cubo.getVertexCount(); i++)
  {
    PVector p;
    Float x, y, z;
    p=cubo.getVertex(i);
    x=p.x;
    y=p.y;
    z=p.z;

    p.x = x + a * y;
    //p.y = p.y * Sy;
    //p.z = p.z * Sz;

    cubo.setVertex(i, p.x, p.y, p.z);

    //System.out.println("i= " +i+ " P(" +p.x+","+p.y+","+p.z+")");

    if (i<triangulo.getVertexCount())
    {
      p=triangulo.getVertex(i);
      x=p.x;
      y=p.y;
      z=p.z;
      p.x = x + a*y;
      //p.y = p.y * Sy;
      //p.z = p.z * Sz;
      triangulo.setVertex(i, p.x, p.y, p.z);
    }
  }

  background(100);
  shape(cubo);
  shape(triangulo);
}




//Essa função implementa a matriz de escala de um objeto em 3D
void escala3(int Sx, int Sy, int Sz)
{ 
  System.out.println("escala ---Sx=" + Sx + "---Sy=" + Sy + "---Sz=" + Sz);

  for (int i=0; i<cubo.getVertexCount(); i++)
  {
    PVector p;
    p=cubo.getVertex(i);

    p.x = p.x * Sx;
    p.y = p.y * Sy;
    p.z = p.z * Sz;

    cubo.setVertex(i, p.x, p.y, p.z);

    //System.out.println("i= " +i+ " P(" +p.x+","+p.y+","+p.z+")");

    if (i<triangulo.getVertexCount())
    {
      p=triangulo.getVertex(i);
      p.x = p.x * Sx;
      p.y = p.y * Sy;
      p.z = p.z * Sz;
      triangulo.setVertex(i, p.x, p.y, p.z);
    }
  }

  background(100);
  shape(cubo);
  shape(triangulo);
}  



//Essa função implementa uma matriz de rotação em torno do eixo y
//é realizado o calculo da nova posição de cada vertice do objeto
void rotation2(float angulo)
{
  System.out.println("Rotação em torno de y --- Angulo="+angulo);

  angulo=radians(angulo);

  for (int i=0; i<cubo.getVertexCount(); i++)
  {
    PVector p;
    Float x, y, z;

    p=cubo.getVertex(i);
    x=p.x;
    y=p.y;
    z=p.z;


    p.x = x * cos(angulo) + z * sin(angulo);
    p.z = -x * sin(angulo) + z * cos(angulo);
    //p.z = p.z * Sz;

    cubo.setVertex(i, p.x, p.y, p.z);

    //System.out.println("i= " +i+ " P(" +p.x+","+p.y+","+p.z+")");

    if (i<triangulo.getVertexCount())
    {
      p=triangulo.getVertex(i);
      x=p.x;
      y=p.y;
      z=p.z;
      p.x = x * cos(angulo) + z * sin(angulo);
      p.z = -x * sin(angulo) + z * cos(angulo);
      //p.z = p.z * Sz;
      triangulo.setVertex(i, p.x, p.y, p.z);
    }
  }
  background(100);
  shape(cubo);
  shape(triangulo);
}   



float angulo=0;
int k=1, veri=0;
int sentido=0;




void draw() 
{
  lights();
  //utilizei a função translate para centralizar o objeto na tela
  translate(width/2, height/2);
  background(100);


  stroke(0);
  fill(255);

  shape(cubo);
  shape(triangulo);
}
