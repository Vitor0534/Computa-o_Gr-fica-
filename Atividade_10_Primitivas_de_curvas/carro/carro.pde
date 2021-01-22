//Aluno: Vitor de Almeida Silva
//Matrícula: 20161003305497

// Este programa implementa uma função Carro(), que gera as cordenadas dos pontos para desenhar um carro na tela.
// O programa fez uso das seguintes funções:
//          * curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2):      Gera uma cura entre 2 pontos controlada por dois pontos;
//          * arc(x, y, width, height, start, stop):              Gera uma elipse centrada em (x,y), largura e altura e angulo do circulo;
//          * bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);     Desenha um arco em dois pontos e controlado por dois pontos.

//PShape carro;

void setup() {
size(600,600);
background(255);
smooth();

stroke(0);
noFill();
Carro();
//shape(carro);

}


void Carro()
{ 
  //carro= createShape();
  beginShape();
  
  //Monobloco (corpo do carro)
  curve(150,350,150,350,100,350,100,350);
  curve(100,350,100,350,100,300,100,300);
  curve(100,250,100,300,200,250,200,200);
  curve(100,420,200,250,350,250,190,250);
  curve(350,270,350,250,383,283,400,300);
  curve(350,300,383,283,500,300,400,300);
  curve(500,300,500,300,500,350,480,400);
  curve(500,350,500,350,450,350,450,350);
  
  //Roda 1 dianteira
  arc(420, 350, 60, 60, 0, radians(360));
  arc(420, 350, 30, 30, 0, radians(360));
  
  curve(500,350,390,350,210,350,450,350);
  
  //Roda 2 trazeira
  arc(180, 350, 60, 60, 0, radians(360));
  arc(180, 350, 30, 30, 0, radians(360));
  
  //luzes trazeiras
  bezier(100, 310, 110, 310, 110, 330, 100, 330);
  curve(100,320,100,320,107,320,110,320);
  
  //luzes dianteira
  bezier(500, 310, 490, 310, 490, 330, 501, 330);
  curve(500,320,500,320,493,320,490,320);
  
  //vidro 1, trazeiro
  curve(210,260,210,260,180,280,180,280);
  curve(180,280,180,280,210,280,210,280);
  curve(210,280,210,280,210,260,210,260);
  
  //vridro 2, meio
  curve(220,280,220,255,275,252,280,277);
  curve(275,252,275,252,275,280,275,280);
  curve(275,280,275,280,220,280,220,280);
  curve(220,280,220,280,220,255,220,255);
  
  //vridro 3, frente
  curve(200,300,290,252,360,280,340,340);
  curve(360,280,360,280,290,280,290,280);
  curve(290,280,290,280,290,252,290,252);
  
  //porta da frente
  curve(285,340,285,340,370,340,375,340);
  curve(370,340,370,340,370,280,370,280);
  curve(370,340,370,280,285,247,100,300);
  curve(285,247,285,247,285,340,285,340);
  
  //tampa do tanque
  arc(150, 300, 15, 15, 0, radians(360));
  
  //maçaneta da porta
  arc(298,295, 15, 10, 0, radians(360));
 
  endShape();
 
}

void draw()
{

}
