/*
Aluno: Vitor de Almeida Silva
Matricula: 2016.1.0033.0549-7
 
 Titulo: The little prince in the Flat earth´s game
 
 Sobre o programa:  
 
      Foi produzido um jogo nomeado de  "The little prince in the Flat earth´s game", cujo o objetivo é mostrar o funcionamento de algumas primitivas de luz presentes no processing, assim como,
 algumas primitivas de controle da camera, são elas:
 
      * ambientLight(255, 255, 255): configura uma luz ambiente RGB que é distribuida uniformemente nos objetos sem ponto específico
                                     não tem formação de sombras;
 
      * directionalLight(R, G, B, left, right, up): produz uma luz direcional RGB, que parte de um ponto especificado, essa luz produz
                                                    efeitos de sombra. no caso ela foi utilizada em conjunto com a luz ambiente para
                                                    produzir mais realismo ao cenário e para gerar uma melhor visualização dos objetos;
 
      * camera(A, B, C, X, Y, Z, 0.0, 1.0, 0.0): Essa função controla a posição da camera, de modo que tem os seguintes parâmetros:
                                                 * (A,B,C)= são parametros que controlão a posição dos olhos na camera
                                                            produzem um efeito de "andar" pelo cenário para a aplicação em questão;
                                                 * (X,Y,Z)= controlam posições de altura, esquerda e direita do ponto de vista da camera
                                                            (estão configurados com valores fixos);
                                                 * os demais parametros controlam orientação de rotação da camera, e são geralmente
                                                   comfigurados com (0.0,1.0,0.0);
      * perspective(): essa primitiva aumenta a sensação de perspectiva da cena com os objetos, usando a posição da camera e a distância entre os objetos 
                       para melhorar a ilusão de distancia e ponto de perspectiva;
 
      * printCamera(): Essa primitiva imprime no terminal do processing as coordenadas da camera naquele momento;
      
      * lightFalloff(1.0, 0.001, 0.0): simula um tipo de degradê calculado por meio da distancia do ponto de luz em uma superfície.
 
      O jogo consiste de um cenário e um personagem, sendo este, uma paródia das teorias de terra plana e do livro o pequeno principe, já que o personagem vive
 em um planetinha pequeno no espaço. As primitivas do processing produzem os efeitos de Luz, sombra e posição da câmera para dar mais realidade 
 ao ambiente.
      O jogo consiste, basicamente, de controlar o personagem representado por um tipo de caixa retangular 3D amarela, podendo alterar posição de camera, ponto de luz
 e rotação do cenário no eixo Z, bastanto para isso, somente mover o mouse.  Também é possível interagir com 3 botões dispostos no piso na frente das casa, ao posicionar o personagem em cima dos botões, os mesmos mudam de cor entre R
 , G ou B. Os controles são os seguintes:
 
       * Controles de camera:  
         - Eixo X =  teclas 4 e 6;
         - Eixo Y =  teclas 8 e 2;
         - Eixo Z =  teclas 7 e 9;
 
       * Controles da posição da Luz:  
         - Eixo X =  teclas a e d;
         - Eixo Y =  teclas w e s;
         - Eixo Z =  teclas q e e;
         
       * Controles da rotação do cenário:
         - Eixo Z mouse: movimente a seta do mouse por cima da tela para realizar uma rotação no eixo Z de todo o cenário
                         Repare que isso não autera a posição da luz,  porém, altera a orientação do cenário, por isso
                         a posição das sombras irá mudar;
 
       * Controles do personagem:  
         - Eixo X =  teclas j e l;
         - Eixo Y =  teclas i e k;
     
 OBS_1: Um desafio encontrado, foi gerar a sombra de um objeto em cima de outro objeto, sendo necessario, para isso, trabalhar com texturas e calculos de 
        posição de sombra e shaders. Deste modo, essa parte foi deixada de lado, utilizando somente as primitivas de luz e sombra comuns do processing;
 OBS_2: conforme se movimenta o ponto de luz é possivel visualizar o efeito de sombra gerados automaticamente pelo processing. Da mesma forma, é possível
        visualizar o cenário em diferentes angulos, controlando a camera e a rotação do cenário;
 */


void setup() {
  size(800, 800, P3D);
  stroke(0);
  fill(204);  
  perspective();
  
}

PShape piramide;

void draw() {
  camera_control();
  background(0);
  stroke(0);
  set_light_position(255, 255, 0);
  //rotateY(map(mouseX, 0, width, 0, PI));    // Rotaciona no eixo Y 
  //rotateX(map(mouseX, 0, width, 0, PI));    // Rotaciona no eixo Y 
  rotateZ(map(mouseY, 0, height, 0, -PI));  // Rotaciona no eixo Z
  //rotateY(PI/3); 
  //rotateZ(PI/newZmag); 
  //draw_Rect(500,500,400,400,255,255,255);
  //rotateY(PI/5); 
  draw_box(500, 500, 10, 400, 400, 0, 100, 200, 150);
  draw_box(100, 100, 70, -150, -150, 40, 200, 200, 150);
  draw_sphere2(60, 250, 250, 22, 100, 150, 200);
  //draw_house(100, 150, 200);
  draw_house(100, 150, 200); 
  translate(-140, 280, 50);
  draw_house(100, 150, 200);
  translate(150, 400, 80);

  // arvore 1
  draw_tree();
  // arvore 2
  translate(10, -130, 20);
  draw_tree();
  //arvore 3
  translate(10, -130, 20);
  draw_tree();

  //morrinho de grama 
  draw_sphere(60, -120, 180, -160, 0, 200, 0);

  //corguinho
  lightFalloff(1.0, 0.001, 0.0);
  draw_box(200, 200, 10, -180, -10, 30, 0, 197, 255);

  //porta da casa 1
  stroke(0);
  draw_box(30, 20, 40, 130, -270, 20, 170, 114, 9);
  //porta da garagem
  stroke(0);
  draw_box(60, 30, 40, -148, 26, 0, 170, 114, 9);

  //muro
  stroke(0);
  draw_box(5, 500, 20, -102, 116, -8, 170, 114, 9);

  //muro 2
  stroke(0);
  draw_box(5, 500, 20, 494, 0, 0, 170, 114, 9);
  //muro 3
  stroke(0);
  draw_box(500, 5, 20, -244, -248, 0, 170, 114, 9);

  //janela da casa 1
  stroke(0);
  draw_box(20, 5, 20, -30, 114, 80, 170, 114, 9);
  //janela da casa 2
  stroke(0);
  draw_box(20, 5, 20, 56, 0, 0, 170, 114, 9);

  //porta casa 2
  stroke(0);
  draw_box(30, 5, 40, 94, 0, -74, 170, 114, 9);

  //chaminé casa 1
  stroke(0);
  draw_box(20, 20, 60, -158, -42, 152, 170, 114, 9);
  
  //janela da casa2_ 1
  stroke(0);
  draw_box(20, 5, 20, 128, 42, -94, 170, 114, 9);
  //janela da casa2_ 2
  stroke(0);
  draw_box(20, 5, 20, 60, 0, 0, 170, 114, 9);
  
  //desenha balanço no cenário
  draw_balanco();
   
  //muro 4
  stroke(0);
  draw_box(500, 5, 20, -116, 228, -10, 170, 114, 9);
  
  
  //Botão 1 R
  stroke(0);
  draw_box(30,30, 10, -18, -310, -12, R, G, B);
  
  //Botão 2 G
  stroke(0);
  draw_box(30,30, 10, 52, 0, 0, R, G, B);
  
  //Botão 3 B
  stroke(0);
  draw_box(30,30, 10, 56, 0, 0, R, G, B);
  
  //pequeno principe 
  gera_little_prince(5-leftPersonagem,-40-rightPersonagem,10, 255, 255, 0);
  

  
}


int R=0,G=200,B=0;

//função que rastreia a posição do personagem e dos botões de modo a mudar a cor em R, G ou B
void muda_cor()
{
  if(leftPersonagem == 5 && rightPersonagem == -40)
  {
    R=G=0;
    B=255;
  }
  else{
    if(leftPersonagem == 60 && rightPersonagem == -40)
  {
    R=B=0;
    G=255;
  }else{
     if(leftPersonagem == 115 && rightPersonagem == -40)
  {
    G=B=0;
    R=255;
  }
  }
  }
}


void draw_balanco()
{
    //Desenhar balanço suporte 1
  draw_box(5, 5, 50, -32, 118, -50, 170, 114, 9);
  //Desenhar balanço suporte 2
  draw_box(5, 5, 50, -5, 74, 0, 170, 114, 9);
  //Desenhar balanço suporte 3
  draw_box(5, 90, 5, 2, -38, 28, 170, 114, 9);
  //Desenhar balanço corda 1
  draw_box(1, 1, 30, -2, -12, -16, 170, 114, 9);
  //Desenhar balanço corda 2
  draw_box(1, 1, 30, 0, 24, 0, 170, 114, 9);
  //Desenhar balanço acento
  draw_box(8, 30, 3, 0, -12, -16, 170, 114, 9);
}
void draw_tree()
{
  //arvore 1******
  draw_box(20, 20, 100, 0, 0, -110, 170, 114, 9); 
  //folhas
  draw_sphere(60, 0, 0, 90, 0, 200, 0);
  //************
}

void draw_piramide(int PosX, int PosY, int PosZ, int R, int G, int B)
{
  fill(R, G, B);
  translate(PosX, PosY, PosZ);
  piramide = createShape();
  piramide.beginShape(TRIANGLE);
  piramide.vertex(-55, -55, -55);
  piramide.vertex( 55, -55, -55);
  piramide.vertex(   0, 0, 55);
  piramide.vertex( 55, -55, -55);
  piramide.vertex( 55, 55, -55);
  piramide.vertex(   0, 0, 55);

  piramide.vertex( 55, 55, -55);
  piramide.vertex(-55, 55, -55);
  piramide.vertex(   0, 0, 55);

  piramide.vertex(-55, 55, -55);
  piramide.vertex(-55, -55, -55);
  piramide.vertex(   0, 0, 55);
  piramide.endShape();
  shape(piramide);
}




void draw_house(int R, int G, int B)
{
  stroke(0);
  draw_piramide(20, -280, 90, 162, 104, 10);
  draw_box(100, 100, 150, 0, 0, -110, R, G, B);
}

void gera_little_prince(int PosX, int PosY, int PosZ, int R, int G, int B)
{
  fill(R, G, B);
  translate(PosX, PosY, PosZ);
  box(10, 10, 20);
}


void camera_control()
{
  camera(70-leftCamera, -409-rightCamera, 700-upCamera, 783, 503, 0.0, 0.0, 1.0, 0.0);
  rotateX(PI/1.7); 
  rotateY(PI/11); 
  // System.out.println(newZmag);
}

void set_light_position(int R, int G, int B)
{
  ambientLight(255, 255, 255);
  directionalLight(R, G, B, left, right, up);
}
//função que mostrar a posição da luz 
void print_position_light()
{
  System.out.println("coordenadas do ponto de luminosidade:");
  System.out.println("\n   X= " + left);
  System.out.println("   Y= " +right);
  System.out.println("   Z= " +up + "\n");
}

void print_camera_position()
{
  System.out.println("coordenadas da posição da camera:");
  printCamera();
}

void print_character_position()
{
  System.out.println("coordenadas da posição do personagem:");
  System.out.println("\n   X= " + leftPersonagem);
  System.out.println("   Y= " +rightPersonagem);
  System.out.println("   Z= " +upPersonagem + "\n");
}

int passo_Light=2, passo_Camera=10, passo_personagem=5;


int up=0, left=width/2, right=height/2;
int upCamera=0, leftCamera=0, rightCamera=0;
int upPersonagem=0, leftPersonagem=0, rightPersonagem=0;



//Esta função percebe um evento de entrada por meio do teclado, de modo que, foi utilizada para criar os controles de camera, posição da luz e do personagem
void keyTyped() {
  if ( key =='a' || key=='A') {
    left=left+passo_Light;
    print_position_light();
  } else {
    if ( key =='d' || key=='D')
    {
      left=left-passo_Light;
      print_position_light();
    } else {
      if ( key =='w' || key=='W')
      {
        right= right+passo_Light;
        print_position_light();
      } else
      {
        if ( key =='s' || key=='S')
        {
          right=right-passo_Light;
          print_position_light();
        } else {
          if ( key =='q' || key=='Q')
          {
            up=up+passo_Light;
            print_position_light();
          } else {
            if ( key =='e' || key=='E')
            {
              up=up-passo_Light;
              print_position_light();
            } else
            {
              if ( key =='4')
              {
                leftCamera+=passo_Camera;
                print_camera_position(); 
              } else
              {
                if ( key =='6')
                {
                  leftCamera-=passo_Camera;
                  print_camera_position();  
                } else
                {
                  if ( key =='8')
                  {
                    rightCamera+=passo_Camera;
                    print_camera_position();  
                  } else
                  {
                    if ( key =='2')
                    {
                      rightCamera-=passo_Camera;
                      print_camera_position(); 
                    } else
                    {
                      if ( key =='7')
                      {
                        upCamera+=passo_Camera;
                        print_camera_position(); 
                      } else
                      {
                        if ( key =='9')
                        {
                          upCamera-=passo_Camera;
                          print_camera_position();  
                        } else
                        {
                          if ( key =='j' || key == 'J')
                          {
                            leftPersonagem+=passo_personagem;
                            print_character_position();
                            muda_cor();
                          } else
                          {
                            if ( key =='l' || key == 'L')
                            {
                              leftPersonagem-=passo_personagem;
                              print_character_position();
                              muda_cor();
                            } else
                            {
                              if ( key =='i' || key == 'I')
                              {
                                rightPersonagem+=passo_personagem;
                                print_character_position();
                                muda_cor();
                              } else
                              {
                                if ( key =='k' || key == 'K')
                                {
                                  rightPersonagem-=passo_personagem;
                                  print_character_position();
                                  muda_cor();
                                } else
                                {
                                  if ( key =='u' || key == 'U')
                                  {
                                    upPersonagem+=passo_personagem;
                                    print_character_position();
                                    muda_cor();
                                  } else
                                  {
                                    if ( key =='o' || key == 'O')
                                    {
                                      upPersonagem-=passo_personagem;
                                      print_character_position();
                                      muda_cor();
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
            }
          }
        }
      }
    }
  }

  //System.out.println("x= " + left + "\ny= " + right + "\nz= " + up);
}




void draw_box(float X, float Y, float Z, int PosX, int PosY, int PosZ, int R, int G, int B)
{
  fill(R, G, B);
  translate(PosX, PosY, PosZ);
  box(X, Y, Z);
}


void draw_sphere2(int circunferencia, int PosX, int PosY, int PosZ, int R, int G, int B)
{
  noFill();
  noStroke();
  translate(PosX, PosY, PosZ);
  sphere(circunferencia);
}

void draw_sphere(int circunferencia, int PosX, int PosY, int PosZ, int R, int G, int B)
{
  fill(R, G, B);
  noStroke();
  translate(PosX, PosY, PosZ);
  sphere(circunferencia);
}

//função que desenha um retangulo na camada escolhida
void draw_Rect(int x, int y, int largura, int altura, int corR, int corG, int corB)
{

  clear();
  noStroke();
  fill(corR, corG, corB);
  rect(x, y, largura, altura);
}
