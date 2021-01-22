// Aluno: Vitor de Almeida Silva
// Matrícula: 20161003305497
//
// O presente código gera uma paleta de cores usando um objeto circulo e um campo que mostra o valor da cor em hexadecimal
/*
// Como funciona:  as mudanças de cores são controladas da seguinte forma (para RGB):

       * R: a posição x do mouse controla o valor de cor R (red) em um intervalo de [0  255];
       * G: a posição y do mouse controla o valor de cor G (green) em um intervalo de [0  255];
       * B: o scroll do mouse controla o valor de cor B (blue) em um intervalo de [0  255];
       * Pause: se ouver um clique no botão esquerdo do mouse a mudança de cores pause,
               isso é para facilitar a visualização da cor, se clicar de novo o processo volta ao normal.

       
*/
color c1=color(0,0,0);
   PFont font;

void setup()
{
  size(800,800,P2D);
  background(100);
  font = createFont("Arial",32,true); // Arial, 32 pontos, anti-aliasing ligado 
  
}

int  newZmag=0;
int pause=0;

void paleta_de_cores()
{
  int R,G,B;
  background(100);
  
  R=verifica_Valor(mouseX);
  G=verifica_Valor(mouseY);
  B=newZmag;
  
  c1= color(R,G,B);
  
  
  //mostra valores de R, G e B no terminal
  System.out.println("R= " + R + "\nG= " + G + "\nB= " + B + "\nHexa = " + hex(c1)); 

  
  fill(c1);
  circle(400,400,400);
  
  //a função hex(c1) retorna o valor de uma cor em hexadecimal
  imprimir_label2("Hex= " + hex(c1),10,100,280,40);
  
  //mostra os valores de R, G e B em inteiro no intervalo [0 255]
  String R1="R= "+R;
  imprimir_label2(R1,10,200,200,40); 
  String G1="G= "+G;
  imprimir_label2(G1,10,240,200,40); 
  String B1="B= "+B;
  imprimir_label2(B1,10,280,200,40); 
}


void draw()
{
  
  if(pause==0)
     paleta_de_cores();

}

//essa função serve para imprimir um alabel genêrica, basta passar o texto e a posição dela
void imprimir_label2(String text, int x, int y,int largura, int altura)
{
   fill(255);
   rect(x-2,y-35,largura,altura);          //cria um fundo quadrado para o texto
   textFont(font,36);
   fill(0);                    // especifica uma cor para a fonte 
   text(text,x,y);          // mostra o texto na label
}



//função que detecta o clique no botão esquerdo do mouse e pausa o processo ou retorna a seleção de cores
void mousePressed() {
  if (mouseButton == LEFT) {
       if(pause==0){
          pause=1;
          textFont(font,18);
          fill(255);  
          text("PAUSED: CLIQUE NO BOTÃO ESQUERDO DO MOUSE PARA RETORNAR",10,750);
       }
       else{
          pause=0;
       }
  }
}

// essa função normaliza o valor em um intervalo [0 255]
int verifica_Valor(int valor)
{
  if(valor>255)
  {
     valor=255;
  }
  else
  {
    if(valor<0)
     valor=0;
  }
  return valor;
}


//fução que capitura a mudança de valor do scrool do mouse 
void mouseWheel(MouseEvent event) {
  newZmag+= -event.getCount();         //oque ocorre é uma soma de valores vindos do scrool
  newZmag=verifica_Valor(newZmag);
}
