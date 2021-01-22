void setup()
{
  size(1000, 1000, P2D);
  colorMode(RGB);
  //background(0, 255, 0);//modelo RGB
  background(255);//modelo RGB

  //alvo(R,G,B)
  stroke(200,34,98); //traço do desenho
  alvo(200, 0, 0);
  
  //circulo(R, G, B)
  stroke(50,34,98);
  circulo(40, 100, 34);
  
  //losango(R, G, B)
  stroke(200,255,98);
  Losango(10, 57, 134);
  
  //boloniudo( centro, corPele, CorOlhoPbranca, corIris, corBoca);
  stroke(56,34,24);
  //noStroke();
  boloniudo(new PVector(-100, 100), color(200, 200, 0), color(255), color(0), color(0));
  
  // triangulo(R, G, B)
  stroke(100,200,50);
  triangulo(100, 200, 10);
  
  //casa(centro, corTelhado, corParede);
  stroke(80,34,98);
  casa(new PVector(-200, 100), color(0, 255, 255), color(200, 0, 100));
  
  //bolonildo sem fundo
  boloniudoNoFill(new PVector(-300, 100));
}

//1) gera um objeto que é uma representação de um alvo
void alvo(int R, int G, int B)
{
  fill(R, G, B);
  circle(400, 400, 90);
  fill(255);
  circle(400, 400, 70);
  fill(R, G, B);
  circle(400, 400, 40);
  fill(255);
  circle(400, 400, 20);
}

//2) cria um circulo
void circulo(int R, int G, int B)
{
  fill(R, G, B);
  circle(100, 100, 100);
}

//3) cria um losangulo
void Losango(int R, int G, int B)
{
  fill(R, G, B);
  quad(200, 200, 250, 250, 300, 200, 250, 150);
}

//4) cria um objeto chamado Boloniudo, 
//essa face pode ser colorida
//      *c1: pele;
//      *c2: olhos;
//      *c3: Cor do olho;
//      *c4: boca;
//PVector é um objeto que pode armazenar cordenas de um ponto
void boloniudo(PVector centro, color c1, color c2, color c3, color c4)
{
  //rosto
  fill(c1);
  ellipse(500-centro.x, 500-centro.y, 150, 200);

  //olhos
  fill(c2);
  circle(470-centro.x, 450-centro.y, 50); //circulo branco
  fill(c3);           
  circle(470-centro.x, 450-centro.y, 10); //iris
  fill(c2);
  circle(525-centro.x, 450-centro.y, 50); //circulo
  fill(c3);
  circle(520-centro.x, 450-centro.y, 10); //iris

  //boca
  stroke(c4);
  line(450-centro.x, 530-centro.y, 550-centro.x, 530-centro.y);
}

//5) define um triangulo
void triangulo(int R, int G, int B)
{
  fill(R, G, B);
  triangle(450, 800, 600, 800, 525, 700);
}


//6) define uma casa simples
void casa(PVector centro, color telhado, color parede)
{
  //parede da casa
  fill(parede);
  square(250 - centro.x, 250 - centro.y, 50);
  //telhado da casa
  fill(telhado);
  triangle(230 - centro.x, 250 - centro.y, 325 - centro.x, 250 - centro.y, 275 - centro.x, 220 - centro.y);
}


//bolonildo sem traço
void boloniudoNoFill(PVector centro)
{
  noFill();
  
  //rosto
  ellipse(500-centro.x, 500-centro.y, 150, 200);
  
  //olhos
  circle(470-centro.x, 450-centro.y, 50); //circulo branco         
  circle(470-centro.x, 450-centro.y, 10); //iris
  circle(525-centro.x, 450-centro.y, 50); //circulo
  circle(520-centro.x, 450-centro.y, 10); //iris

  //boca
  stroke(0);
  line(450-centro.x, 530-centro.y, 550-centro.x, 530-centro.y);
}


void draw()
{
}
