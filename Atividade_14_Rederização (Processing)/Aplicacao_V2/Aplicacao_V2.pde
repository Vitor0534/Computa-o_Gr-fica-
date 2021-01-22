/*
 Aluno: Vitor de almeida silva
 Matricula: 20161003305497
 
 O presente programa, tem o propósito de mostrar um exemplo da utilização das funções de rederização do processing,
 para tanto, é proposto um jogo "coloring your own robot game :D". Tal jogo consiste da produção de uma paleta de cores em camada,
 a qual, colore cada parte de um objeto "Robô" quando está for posicionado acima da paleta.  
 
   Desta forma, foi definido um objeto composto por 6 outros objetos rect, tal objeto representa a figura de um robô. o objetivo do programa,
 é que o usuário possa colorir cada parte do robô utilizando a paleta de cores RGB. 
 
 Como funciona:
 
   * É possível organizar cores R, G, B modicando os valores nas slide bars na base ta tela;
   * Para selecionar um objeto, basta clicar sobre o mesmo e arrasta-lo, a CAMADA do objeto é indicada
     em uma label na parte superior da tela;
   * Quando o objeto passar por cima da paleta de cores, o mesmo será colorido da mesma cor da paleta.
 
 OBS1: Em termos das primitivas, foram utilizadas as seguintes:
 
   * PGraphics : essa primitiva cria uma layer nova, de modo que, possa ser tratada individualmente. 
                 essa layer pode ser imaginada como uma nova superficeie na tela, com dimensões definidas
                 que pode ser tratada de forma individual; 
 
   * Tint(a,b) : configura a transparencia do objeto em um intervalo definido em "a" (255) controlado por "b". 
                 essa função foi utilizada para tornas os objetos um pouco transparentes, de modo que, seja possível visualizar a sobreposição das camadas;
 
   * blendMode(BLEND): Essa primitiva tem a funcionalidade de combinar as cores entre as camadas, ela fornece diversos tipos de opções de blend, sendo que a escolhida
                       foi a função padrão:
                             - BLEND: interpolação linear de cores C=A*factor+B. é a opção padrão da primitiva blendMod();      
                       Essa função é utilizada para fornecer uma combinação suave entre as cores quando as camadas estiverem se sobrepondo.

 OBS2: da maneira que o programa foi organizado, o mouse vai selecionar sempre a camada que estiver abaixo da outra, isto é, se o mouse
       estiver sobre a camada 2, por exemplo, e ela sobrepor em uma certa região na camada 1 a camada 1 será selecionada.
       
 OBS3: a paleta de cores, tanto quanto as slide bars, estão na camada principal da janela, os outros objetos estão em camadas diferentes.
 
 */


int value = 0;

//corpo
int x1=75;
int y1=115;
int lar1=100;
int alt1=100;

//cabeça
int x2=100;
int y2=60;
int lar2=50;
int alt2=50;

//braço 1 esquerdo
int x3=x1-20;
int y3=115;
int lar3=15;
int alt3=70;

//braço 2 direito
int x4=lar1+80;
int y4=115;
int lar4=15;
int alt4=70;

//perna 1 esquerda
int x5=90;
int y5=alt1+120;
int lar5=20;
int alt5=50;

//perna 2 direita
int x6=140;
int y6=alt1+120;
int lar6=20;
int alt6=50;

//definindo camadas das partes do Robô
//corpo
PGraphics rect1;
//cabeça
PGraphics rect2;
//braço esquedo
PGraphics rect3;
//braço direito
PGraphics rect4;
//perna esquerda
PGraphics rect5;
//perna direita
PGraphics rect6;

PShape slide1, slide2, slide3;

PFont font; //declara um fonte para ser utilizada nas labels

color c1=color(0, 0, 0);

//pontos da slide bar
int xR=1, yR=700;
int xG=1, yG=750;
int xB=1, yB=800;
int XLinha=10;
int larguraBar=20;
int larguraLinha=255;

//cores dos objetos
int R1=255, G1=255, B1=255;
int R2=255, G2=255, B2=255;
int R3=255, G3=255, B3=255;
int R4=255, G4=255, B4=255;
int R5=255, G5=255, B5=255;
int R6=255, G6=255, B6=255;

//coordenadas da paleta de cores
int Px=500;
int Py=750;
int Pdiametro=150;

void setup()
{
  size(850, 850, P3D);
  rect1= createGraphics(width, height, P2D);
  rect2= createGraphics(width, height, P2D);
  rect3= createGraphics(width, height, P2D);
  rect4= createGraphics(width, height, P2D);
  rect5= createGraphics(width, height, P2D);
  rect6= createGraphics(width, height, P2D);
  font = createFont("Arial", 32, true); // Arial, 32 pontos, anti-aliasing ligado
  blendMode(BLEND); //primitiva que combina as cores das camadas quando as mesmas estiverem sobrepostas
}


void draw() {
  background(230);
  //corpo
  drawRect(rect1, x1, y1, lar1, alt1, R1, G1, B1);
  //cabeça
  drawRect(rect2, x2, y2, lar2, alt2, R2, G2, B2);
  //braço1
  drawRect(rect3, x3, y3, lar3, alt3, R3, G3, B3);
  //braço2
  drawRect(rect4, x4, y4, lar4, alt4, R4, G4, B4);
  //perna 1
  drawRect(rect5, x5, y5, lar5, alt5, R5, G5, B5);
  //perna 2
  drawRect(rect6, x6, y6, lar6, alt6, R6, G6, B6);

  //imprime paleta de cores e slide bar para R, G e B
  paleta_de_cores(Px, Py, Pdiametro);
  slide_barR(XLinha, yR+10, xR, yR, larguraLinha, 3, larguraBar, larguraBar);
  slide_barR(XLinha, yG+10, xG, yG, larguraLinha, 3, larguraBar, larguraBar);
  slide_barR(XLinha, yB+10, xB, yB, larguraLinha, 3, larguraBar, larguraBar);

  //mostra os valores de R, G e B em inteiro no intervalo [0 255]
  String R1="R= "+xR;
  imprimir_label2(R1, XLinha+270, yR+20, 36); 
  String G1="G= "+xG;
  imprimir_label2(G1, XLinha+270, yG+20, 36); 
  String B1="B= "+xB;
  imprimir_label2(B1, XLinha+270, yB+20, 36); 
  
  imprimir_label2("Coloring your own robot Game :D", width-280, 25, 18);


  tint(255, 230); //função que define a transparencia da camada 
  image(rect1, 0, 0);

  //tint(255, 100);
  image(rect2, 0, 0);

 // tint(255, 255);
  image(rect3, 0, 0);

 // tint(255, 100);
  image(rect4, 0, 0);

 // tint(255, 255);
  image(rect5, 0, 0);

 // tint(255, 100);
  image(rect6, 0, 0);
}


//função que gera uma slide bar
void slide_barR(int x1, int y1, int x2, int y2, int largura1, int altura1, int largura2, int altura2)
{
  fill(255);
  rect(x1, y1, largura1, altura1);
  fill(0, 200, 0);
  rect(x2, y2, largura2, altura2);
}

//função que gera uma paleta de cores RGB simplificada controlada pela slide bar
void paleta_de_cores(int x, int y, int diametro)
{
  int R, G, B;
  R=xR;
  G=xG;
  B=xB;
  c1= color(R, G, B);
  //mostra valores de R, G e B no terminal
  fill(c1);
  circle(x, y, diametro);
}


//função que desenha um retangulo na camada escolhida
void drawRect(PGraphics rect, int x, int y, int largura, int altura, int corR, int corG, int corB)
{
  rect.beginDraw();
  // rect.translate(posX,posY);
  rect.clear();
  noStroke();
  rect.fill(corR, corG, corB);
  rect.rect(x, y, largura, altura);
  rect.endDraw();
}


//função que detecta o clique seguido do arrastar o mouse, ela é usada para possibilitar a interação do usuário com o programa
void mouseDragged() 
{

  //controla obj Camada 1: corpo
  if ( (mouseX>=x1 && mouseX<=x1+lar1) && (mouseY>=y1 && mouseY<=y1+alt1))
  {
    if ( (mouseX-lar1/2 > 0 &&  mouseX+lar1/2 < rect2.width)  && (mouseY-alt1/2 > 0 && mouseY+alt1/2 < rect2.height)) {
      x1=mouseX-lar1/2;
      System.out.println(mouseX-lar1/2); 
      y1=mouseY-alt1/2;
      //rect1.translate(x1, y1, newZmag);
      imprimir_label2("Camada 1: corpo", 10, 30, 36);

      //verifica se o objeto está acima da paleta, se ss, ele é colorido da mesma cor da paleta
      if ( (x1+lar1/2 > (Px-Pdiametro/2) &&  x1+lar1/2 < (Px+Pdiametro/2))  && (y1+alt1/2 > (Py-Pdiametro/2)  && y1+alt1/2 < (Py+Pdiametro/2))) 
      {
        R1=xR;  //coleta as cores dos valores definidos nas slide bars
        G1=xG;
        B1=xB;
      }
    }
  } else
  { 
    //controla obj Camada 2: cabeça
    if ( (mouseX>=x2 && mouseX<=x2+lar2) && (mouseY>=y2 && mouseY<=y2+alt2))
    {

      if ( (mouseX-lar2/2 > 0 &&  mouseX+lar2/2 < rect2.width)  && (mouseY-alt2/2 > 0 && mouseY+alt2/2 < rect2.height)) {
        x2=mouseX-lar2/2;
        System.out.println(mouseX-lar2/2); 
        y2=mouseY-alt2/2;
        imprimir_label2("Camada 2: cabeça", 10, 30, 36);

        //verifica se o objeto está acima da paleta, se ss, ele é colorido da mesma cor da paleta
        if ( (x2+lar1/2 > (Px-Pdiametro/2) &&  x2+lar1/2 < (Px+Pdiametro/2))  && (y2+alt1/2 > (Py-Pdiametro/2)  && y2+alt1/2 < (Py+Pdiametro/2))) 
        {
          R2=xR;  //coleta as cores dos valores definidos nas slide bars
          G2=xG;
          B2=xB;
        }
      }
    } else
    { 
      //controla slide bar R
      if ( (mouseX>=xR && mouseX<=xR+larguraBar) && (mouseY>=yR && mouseY<=yR+larguraBar))
      {
        if ((mouseX > XLinha &&  mouseX < larguraLinha+10 )) {
          xR=mouseX-10; 
          imprimir_label2("Camada 0: cor R", 10, 30, 36);
        }
      } else
      { //controla slide bar G
        if ( (mouseX>=xG && mouseX<=xG+larguraBar) && (mouseY>=yG && mouseY<=yG+larguraBar))
        {
          if ((mouseX > XLinha  &&  mouseX < larguraLinha +10)) {
            xG=mouseX-10; 
            imprimir_label2("Camada 0: cor G", 10, 30, 36);
          }
        } else
        {
          //controla slide bar B
          if ( (mouseX>=xB && mouseX<=xB+larguraBar) && (mouseY>=yB && mouseY<=yB+larguraBar))
          {
            if ((mouseX > XLinha  &&  mouseX < larguraLinha +10 )) {
              xB=mouseX-10; 
              imprimir_label2("Camada 0: cor B", 10, 30, 36);
            }
          } else
          {
            //camada 3
            if ( (mouseX>=x3 && mouseX<=x3+lar3) && (mouseY>=y3 && mouseY<=y3+alt3))
            {
              if ((mouseX-lar3/2 > 0 &&  mouseX+lar3/2 < rect3.width)  && (mouseY-alt3/2 > 0 && mouseY+alt3/2 < rect3.height)) {
                x3=mouseX-lar3/2;
                System.out.println(mouseX-lar3/2); 
                y3=mouseY-alt3/2;
                imprimir_label2("Camada 3: braço_esquerdo", 10, 30, 36);

                //verifica se o objeto está acima da paleta, se ss, ele é colorido da mesma cor da paleta
                if ( (x3+lar3/2 > (Px-Pdiametro/2) &&  x3+lar3/2 < (Px+Pdiametro/2))  && (y3+alt3/2 > (Py-Pdiametro/2)  && y3+alt3/2 < (Py+Pdiametro/2))) 
                {
                  R3=xR;  //coleta as cores dos valores definidos nas slide bars
                  G3=xG;
                  B3=xB;
                }
              }
            } else
            {
              //Camada 4: braço_direito
              if ( (mouseX>=x4 && mouseX<=x4+lar4) && (mouseY>=y4 && mouseY<=y4+alt4))
              {
                if ((mouseX-lar4/2 > 0 &&  mouseX+lar4/2 < rect4.width)  && (mouseY-alt4/2 > 0 && mouseY+alt4/2 < rect4.height)) {
                  x4=mouseX-lar4/2;
                  System.out.println(mouseX-lar4/2); 
                  y4=mouseY-alt4/2;
                  imprimir_label2("Camada 4: braço_direito", 10, 30, 36);

                  //verifica se o objeto está acima da paleta, se ss, ele é colorido da mesma cor da paleta
                  if ( (x4+lar4/2 > (Px-Pdiametro/2) &&  x4+lar4/2 < (Px+Pdiametro/2))  && (y4+alt4/2 > (Py-Pdiametro/2)  && y4+alt4/2 < (Py+Pdiametro/2))) 
                  {
                    R4=xR;  //coleta as cores dos valores definidos nas slide bars
                    G4=xG;
                    B4=xB;
                  }
                }
              } else
              {
                //Camada 5: perna_esquerda
                if ( (mouseX>=x5 && mouseX<=x5+lar5) && (mouseY>=y5 && mouseY<=y5+alt5))
                {
                  if ((mouseX-lar5/2 > 0 &&  mouseX+lar5/2 < rect5.width)  && (mouseY-alt5/2 > 0 && mouseY+alt5/2 < rect5.height)) {
                    x5=mouseX-lar5/2;
                    System.out.println(mouseX-lar5/2); 
                    y5=mouseY-alt5/2;
                    imprimir_label2("Camada 5: perna_esquerda", 10, 30, 36);

                    //verifica se o objeto está acima da paleta, se ss, ele é colorido da mesma cor da paleta
                    if ( (x5+lar5/2 > (Px-Pdiametro/2) &&  x5+lar5/2 < (Px+Pdiametro/2))  && (y5+alt5/2 > (Py-Pdiametro/2)  && y5+alt5/2 < (Py+Pdiametro/2))) 
                    {
                      R5=xR;  //coleta as cores dos valores definidos nas slide bars
                      G5=xG;
                      B5=xB;
                    }
                  }
                } else
                {

                  //Camada 6: perna_direita
                  if ( (mouseX>=x6 && mouseX<=x6+lar6) && (mouseY>=y6 && mouseY<=y6+alt6))
                  {
                    if ((mouseX-lar6/2 > 0 &&  mouseX+lar6/2 < rect6.width)  && (mouseY-alt6/2 > 0 && mouseY+alt6/2 < rect6.height)) {
                      x6=mouseX-lar6/2;
                      System.out.println(mouseX-lar6/2); 
                      y6=mouseY-alt6/2;
                      imprimir_label2("Camada 6: perna_direita", 10, 30, 36);

                      //verifica se o objeto está acima da paleta, se ss, ele é colorido da mesma cor da paleta
                      if ( (x6+lar5/2 > (Px-Pdiametro/2) &&  x6+lar6/2 < (Px+Pdiametro/2))  && (y6+alt6/2 > (Py-Pdiametro/2)  && y6+alt6/2 < (Py+Pdiametro/2))) 
                      {
                        R6=xR;  //coleta as cores dos valores definidos nas slide bars
                        G6=xG;
                        B6=xB;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


//essa função serve para imprimir uma label genêrica, basta passar o texto e a posição dela
//x=codenada x da labe, y=cordenada y, tamFonte= tam da fonte do texto
void imprimir_label2(String text, int x, int y, int tamFonte)
{
  fill(255);
  rect(x-2, y-tamFonte, text.length()*23, tamFonte+10);          //cria um fundo quadrado para o texto
  textFont(font, tamFonte);
  fill(0);                    // especifica uma cor para a fonte 
  text(text, x, y);          // mostra o texto na label
}
