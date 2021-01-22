// Alunos:
//   1. Higor Alves Ferreira     Matricula: 20161003305438
//   2. Lucas Macedo da Silva    Matricula: 20161003305470
//   3. Vitor de Almeida Silva   Matricula: 20161003305497
// 
//     Emoji: Um mago implacável nunca revela seus segredos
//     Pressione o botão direito do mouse para revelar a mensagem
/*
       O presente programa tem como objetivo, criar um emoji modelado em 3D que demonstre a expreção de DÚVIDA animada em loop. 
       Para tanto, foram trabalhadas características de luz, textura, posição da câmera, transformações de objetos e geração de formas. 
       As seguintes funções e formas foram empregadas para os principais detalhes:
       
            * bezier(): Para desenhos com linhas curvas, como sombrancelhas e boca;
            * elpise(): Para desenhos de formas elípitas ou circulares, como olhos;
            * Sphere(): utilizada para o corpo do emoji e as magias que brilham em volta do mesmo;
            * Cone(): utilizada para desenhar o chapeu do personagem;
            * Texture(): utilizada para colcoar textura em partes do personbagem, como no corpo;
       
       Sobre a expressão:
            * A dúvida foi expressada no emoji animando as sombrancelhas, boca e olhos. De modo que, uma das sombrancelhas permanece
             mais elevada que outra e, da mesma forma, ocorrem deformações nos traços dos olhos e boca;
       Sobre a interação:
            * É possivel interagir com o emoji das seguintes formas:
                  - Eixos x e y do mouse:  o movimento do mouse dobre a tela, muda a posição da câmera, proporcionando vistas
                                          do emoji em diferentes ângulos;
                  - Clique do mouse: clicando com o botão esquerdo do mouse, é possível alterar a posição da luz, e revelar
                                     a mensagem secreta do mago;
                  - Clique no teclado: clicando na tecla 'a' é possível tocar a música de fundo e apresentar uma nova expressão. Clicando
                                       na tecla espaço é possível pausar a animação do emoji.


*/
// ------------------------------- Variaveis Globais --------------------------------------------------------------
int cont = 1;
boolean run = true;  // Controla a execução

import processing.sound.*;
SoundFile file;
float L=2;

// Posição da luz
int x = 1;        
int y = 0; 
int z = 0;

// Controla a mensagem
boolean msg = false;
int cont_msg = 0;     // Conta em quantos frames a mensagem aparecerá

// Monta o emoji
Mago mago;
Mago magoMusico;

Cabeca cabeca;

Sombrancelha sombrancelhaDir; // Mexe
Sombrancelha sombrancelhaEsq;

Olho olhoDir;
Olho olhoEsq;

Chapeu chapeu;

Boca boca;

Magia magia1;
Magia magia2;
Magia magia3;
Magia magia4;

Mensagem msg_mago;
Mensagem msg_interrogacao;
// ------------------------------- Variaveis Globais --------------------------------------------------------------

// ------------------------------- Configuração -------------------------------------------------------------------
void setup() {
  size(800, 800, P3D);
  colorMode(RGB, 255);
  file = new SoundFile(this,"magoImplacavel_cut.mp3");
  
  frameRate(30);
  
  magia1 = new Magia(20, -350, 180, -270, 255, 247, 3);
  magia2 = new Magia(20, 280, -50, -40, 3, 249, 255);
  magia3 = new Magia(20, -30, -310, -240, 16, 255, 0);
  magia4 = new Magia(20, 110, 160, -120, 255, 0, 153);
  
  msg_mago = new Mensagem("Um mago nunca revela\n     seus segredos", 0, 0, 75, 255, 20, -380, -150);
  msg_interrogacao = new Mensagem("?", 450, -20, 110, 255, 100, -380, -150);
  
  msg_interrogacao.exibe_mensagem();
  
  // Mago
  cabeca = new Cabeca(80, 0, 0, 0,"textura_Alter2.jpg");
  
  boca = new Boca(-50, 30, -7.5, 
                  -30, 20, 0, 
                   20, 20, 0, 
                   40, 30, -7.5,
                    -25, 5,
                    0, 1.5);
  
  chapeu = new Chapeu(80, 150, 123, 10, 133, 0, -200, 0);
  
  
  sombrancelhaDir = new Sombrancelha(  -5,  0, 0.0,
                                        0.0, -15.0, 0,
                                        25, -15.0, 0,
                                        25,  0, 0, 
                                        15, -20, 80);
                  
  sombrancelhaEsq = new Sombrancelha(  -5, 0, 0.0,
                                        0.0, 5, 0,
                                        25, 5, 0,
                                        25, 0, 0, 
                                        -35, -20, 80);
  olhoDir = new Olho (-25, -5, 90);
  olhoEsq = new Olho (25, -5, 90);
  mago = new Mago(cabeca, sombrancelhaDir, sombrancelhaEsq, olhoDir, olhoEsq, chapeu, boca);
  // Mago Músico
  cabeca = new Cabeca(80, 0, 0, 0,"textura2.jpg");
  sombrancelhaEsq = new Sombrancelha(  -5, 0, 0.0,
                                        0.0, -15, 0,
                                        25, -15, 0,
                                        25, 0, 0, 
                                        -35, -20, 80);
  boca = new Boca(-50, 20, -7.5, 
                  -30, 20, 0, 
                   20, 20, 0, 
                   40, 20, -7.5,
                   40, 60,
                   1, 1.5);
                    
  magoMusico = new Mago(cabeca, sombrancelhaDir, sombrancelhaEsq, olhoDir, olhoEsq, chapeu, boca);
}
// ------------------------------- Configuração -------------------------------------------------------------------

// ------------------------------- Draw ---------------------------------------------------------------------------
int count_musica = 0;
void draw() {

  if (run){
  
    background(10,10,10);
    stroke(255);
    
    camera(mouseX, mouseY, (height/2) / tan(PI/6), mouseX, height/2,  0, 0 , mouseY, (width/2) / tan(PI/6));  
      
    translate(width/2, height/2, 0);

    if (msg)
    {
      cont_msg ++; 
      if (cont_msg >= 300)
      {
        msg = false;
        cont_msg = 0;
      }
      msg_mago.exibe_mensagem();
    }
    
    //magia1.anima_magia();
    //magia2.anima_magia();
    //magia3.anima_magia();
    //magia4.anima_magia();
    
    controleLuz();  
  
    eye_animation();
        
    if(veri2==1 && file.isPlaying()){
      draw_micro(2,56,70);
      if (count_musica > 100 && count_musica < 200 ||
          count_musica > 260 && count_musica < 375 ||
          count_musica > 260 && count_musica < 300 ||
          count_musica > 450 && count_musica < 600){
            
        magoMusico.boca.set_TaxaInc(0);
      }else{
        magoMusico.boca.set_TaxaInc(1.5);
      }
      magoMusico.anima_mago(0, 0, 50);
      
      if (count_musica > 574)
        msg_interrogacao.set_msg("?");
      
      pushMatrix();
      rotateZ(frameCount*0.01);
      magia1.anima_magia();
      magia2.anima_magia();
      magia3.anima_magia();
      magia4.anima_magia();
      popMatrix();
      
      count_musica ++;
    } else{
      msg_interrogacao.set_msg("?");
      veri2 = 0;
      count_musica = 0;
      magia1.anima_magia();
      magia2.anima_magia();
      magia3.anima_magia();
      magia4.anima_magia();
      mago.anima_mago(posX, posY_somb, i);   
    }  
  }
}
// ------------------------------- Draw ---------------------------------------------------------------------------

// ------------------------------- Interação ----------------------------------------------------------------------
void mousePressed() {
  msg = true;
  if (cont == 1){
    x=x*(-1);
    cont++;
  }else if(cont==2){
    x = 0;
    cont++;
  }else if (cont == 3){
    y=1;
    cont++;
  }else if(cont==4){
    y=y*-1;
    cont++;
  }else if (cont == 5){
    y = 0;
    cont++;
  }else if (cont == 6){
    z=1;
    cont++;
  }else if(cont==7){
    z=z*-1;
    cont++;
  }else if (cont == 8){
    z = 0;
    x = -1;
    cont = 1;
  }
}

int veri2=0;

void keyPressed() {
  if(key==' ' || key == 32){
    run = !run;
  }
  else{
    if(key=='a'||key=='A'){
      if(veri2 == 0){
        file.play();
        file.amp(0.5);
        file.rate(1);
        veri2=1;
        msg_interrogacao.set_msg("♪♫");
     }else{
        veri2=0;
        file.stop();
        msg_interrogacao.set_msg("?");
     }
    }
  }
}
// ------------------------------- Interação ----------------------------------------------------------------------

// ------------------------------- Outras Funções -----------------------------------------------------------------
void controleLuz(){
  ambientLight(255,255,255);
  directionalLight(217, 217, 25, x, y, z);
}

void draw_micro(int PosX,int PosY,int PosZ)
{
  pushMatrix();
  translate(PosX, PosY, PosZ);

  draw_box(15, 100, 15, -2, 54, 98, 120, 119, 131); 

  draw_sphere(35, 0, 0, 90, 84, 73, 250);

  popMatrix();
}

void draw_box(float X, float Y, float Z, int PosX, int PosY, int PosZ, int R, int G, int B)
{
  pushMatrix();
  fill(R, G, B);
  translate(PosX, PosY, PosZ);
  box(X, Y, Z);
  popMatrix();

}

void draw_sphere(int circunferencia, int PosX, int PosY, int PosZ, int R, int G, int B)
{
  pushMatrix();
  PImage image = loadImage("textura_microfone.jpg");
  PShape esfera = createShape(SPHERE, circunferencia);
  esfera.beginShape(SPHERE);
  esfera.endShape(CLOSE);
  esfera.setTexture(image);
  //fill(R, G, B);
  esfera.setStroke(false);
  translate(PosX, PosY, PosZ);
  shape(esfera);
  //sphere(circunferencia);
  popMatrix();
}


int i=80;
int posX=0, posY=0; 
int veri=0,posY_somb=0;

void eye_animation(){
  
  if (i > 40 && veri == 0) {
    i--;
    // Anima iris
    if (posX>=-10)
    { 
      posX--;
    }
    // Anima sombrancelha
    if (posY_somb>=-5){ 
      posY_somb--;
    }
    // Anima abrir e fechar de olhos
    if (i==41){
      veri=1;
    }
    msg_interrogacao.set_text_size(-1);
    msg_interrogacao.exibe_mensagem();
  } else {
    if (i<80 && veri==1)
    {
      i++;
      if (posX<=0)
      { 
        posX++;
      }
      if (posY_somb<=5)
      { 
      posY_somb++;
      }
      msg_interrogacao.set_text_size(1);
      msg_interrogacao.exibe_mensagem();
      if (i==79)
      {
        veri=0;
      }
    }
  }
}
// ------------------------------- Outras Funções -----------------------------------------------------------------

// ################################################### Classes ####################################################
// ------------------------------- Mago ---------------------------------------------------------------------------
class Mago {
  Cabeca cabeca;

  Sombrancelha sombrancelhaDir;
  Sombrancelha sombrancelhaEsq;
  
  Olho olhoDir;
  Olho olhoEsq;
  
  Chapeu chapeu;
  
  Boca boca;
  
  Mago (Cabeca pCabeca, Sombrancelha pSombrancelhaDir, Sombrancelha pSombrancelhaEsq, Olho pOlhoDir, Olho pOlhoEsq, Chapeu pChapeu, Boca pBoca){
    cabeca = pCabeca;
    
    sombrancelhaDir = pSombrancelhaDir;
    sombrancelhaEsq = pSombrancelhaEsq;
    
    olhoDir = pOlhoDir;
    olhoEsq = pOlhoEsq;
    
    chapeu = pChapeu;
    
    boca = pBoca;
    
  }
  
  void anima_mago(int posIris, int posSomb, int alturaOlho){
    
    cabeca.desenha_cabeca();
    chapeu.desenha_chapeu();
    
    
    boca.sorriso();
    
    olhoDir.desenha_olho(alturaOlho, 100, posIris);
    olhoEsq.desenha_olho(alturaOlho, 100, posIris);
    
    sombrancelhaDir.anima_sombrancelha(posSomb);
    sombrancelhaEsq.desenha_sombrancelha(); 
  }
}
// ------------------------------- Mago ---------------------------------------------------------------------------


// ------------------------------- Olho ---------------------------------------------------------------------------
class Olho {
    int X; 
    int Y; 
    int Z;
    
    float escala = 0.25;
    
    Olho(int pX, int pY, int pZ){
      X = pX; 
      Y = pY; 
      Z = pZ;
    }
    
    void desenha_olho(int pAltura, int pLargura, int pXIris)
    {
      pushMatrix();
      strokeWeight(5);
      stroke(0);
      fill (255);
      translate(X, Y, Z);
      
      float aux = 0.25;
     
      // Parte branca do olho
      ellipse(0, 0, pLargura*aux, pAltura*aux);
      
      // Iris
      circle(pXIris, 0, 6);
      
      popMatrix();
    }
    
}
// ------------------------------- Olho ---------------------------------------------------------------------------

// ------------------------------- Sombrancelha -------------------------------------------------------------------
class Sombrancelha{
    float xC1, yC1, zC1; 
    float xP1, yP1, zP1; 
    float xP2, yP2, zP2; 
    float xC2, yC2, zC2; 
    
    int X; int Y; int Z;
    
    Sombrancelha(float xpC1, float ypC1, float zpC1, float xpP1, float ypP1, float zpP1, float xpP2, float ypP2, 
                  float zpP2, float xpC2, float ypC2, float zpC2, int pX, int pY, int pZ){
      xC1 = xpC1;
      yC1 = ypC1;
      zC1 = zpC1;
      
      xP1 = xpP1;
      yP1 = ypP1;
      zP1 = zpP1;
      
      xP2 = xpP2;
      yP2 = ypP2;
      zP2 = zpP2; 
      
      xC2 = xpC2;
      yC2 = ypC2;
      zC2 = zpC2;
      
      X = pX;
      Y = pY;
      Z = pZ;
    }
    
    void desenha_sombrancelha(){
       pushMatrix();
       translate(X, Y, Z);
       strokeWeight(5);
       stroke(10);
       noFill();
       bezier(xC1,  yC1,  zC1,  xP1,  yP1,  zP1, xP2,  yP2,  zP2, xC2,  yC2,  zC2); 
      
       popMatrix();
    }
    
    void anima_sombrancelha(int y){
       pushMatrix();
       translate(X, Y, Z);
       strokeWeight(5);
       stroke(10);
       noFill();
       bezier(xC1,  y,  zC1,  xP1,  yP1 + y,  zP1, xP2,  yP2 + y,  zP2, xC2,  y,  zC2); 
       popMatrix();
    }
    
    
}
// ------------------------------- Sombrancelha -------------------------------------------------------------------

// ------------------------------- Boca ---------------------------------------------------------------------------
class Boca {
  
  // Pontos de controle da curva de Bezier
  float xC1, yC1, zC1;
  float xC2, yC2, zC2;

  // Pontos âncora da curva de Bezier
  float xP1, yP1, zP1;
  float xP2, yP2, zP2;
  
  // Controla a animação da boca
  float inc;    // Controla a abertura
  float aux = 1;
  int aux2;
  int lim1;   // Abertura minima
  int lim2;   // Abertura Maxima
  
  
  float taxaInc;
  
  Boca (float xpC1, float ypC1, float zpC1, float xpP1, float ypP1, float zpP1, float xpP2, float ypP2, 
  float zpP2, float xpC2, float ypC2, float zpC2, int pLim1, int pLim2, int pInc, float pTaxaInc){
     xC1 = xpC1;
     yC1 = ypC1;
     zC1 = zpC1;
      
    
     xC2 = xpC2;
     yC2 = ypC2;
     zC2 = zpC2;
    
     xP1 = xpP1;
     yP1 = ypP1;
     zP1 = zpP1;
    
     xP2 = xpP2;
     yP2 = ypP2;
     zP2 = zpP2; 
     
     taxaInc = pTaxaInc;
     
     lim1 = pLim1;
     lim2 = pLim2;
     
     if (pInc == 1)
       aux2 = 1;
     else
       aux2 = -1;
     
     inc = 0;
  }
  
  void atualizar_coordenadas(float y1, float y2){
    // Atualiza a boca
    // Atualiza a poisção atual dos pontos de controle da curva
    yP1 = aux2*y1;
    yP2 = aux2*y2;
    
  }
  
  void set_Yp(float pYP){
    yP1 = pYP;
    yP2 = pYP;
  }
  
  void set_TaxaInc(float pTaxainc){
    taxaInc = pTaxainc;
  }
  
  void desenhar_boca(){
    pushMatrix();
    translate(5,2,85);
    fill(255);
    stroke(0);
    bezier(xC1,  yC1,  zC1,  xP1,  yP1,  zP1, xP2,  yP2,  zP2, xC2,  yC2,  zC2);
    line(xC1,  yC1,  zC1, xC2,  yC2,  zC2);
    popMatrix();
  }
  
  void sorriso(){
    
  
    atualizar_coordenadas(inc, inc);
    desenhar_boca();
    inc += aux;
    if (inc <= lim1){
      aux = taxaInc;
    }else{
      if (inc >= lim2) {
          aux = -taxaInc;
      }
    }
  }
  
}
// ------------------------------- Boca ---------------------------------------------------------------------------

// ------------------------------- Magia --------------------------------------------------------------------------
class Magia {
 float circunferencia;
 float posX;
 float posY;
 float posZ;
 int R;
 int G;
 int B;
 float circ_max;
 
 int inc = -1;
 
 Magia (float pCircunferencia, float pPosX, float pPosY, float pPosZ, int pR, int pG, int pB){
    circunferencia = pCircunferencia;
    posX = pPosX;
    posY = pPosY;
    posZ = pPosZ;
    R = pR;
    G = pG;
    B = pB;
    circ_max = circunferencia;
 }
 
 void atualiza_circunferencia(){
   if (circunferencia == circ_max){
     inc = -1;
   } else {
    if (circunferencia == 0){
      inc = 1;
    }
   }
   circunferencia += inc;
 }
 
 void anima_magia()
  {
    atualiza_circunferencia();
    pushMatrix();
    fill(R, G, B);
    noStroke();
    translate(posX, posY, posZ);
    sphere(circunferencia);
    popMatrix();
  } 
 
}
// ------------------------------- Magia --------------------------------------------------------------------------

// ------------------------------- Cabeça -------------------------------------------------------------------------
class Cabeca {
  int raio;
  int R;
  int G;
  int B;
  float x;
  float y;
  float z;
  PImage imagem;
  PShape forma;
  
  Cabeca(int pRaio,  float pX, float pY, float pZ, String caminho ){
    raio = pRaio;
    x = pX;
    y = pY;
    z = pZ;
    
    imagem = loadImage(caminho);
    forma = createShape(SPHERE, raio);
    forma.beginShape(SPHERE);
    forma.endShape(CLOSE);
    forma.setStroke(false);
    forma.setTexture(imagem);
    
  }
  
  void desenha_cabeca(){
    pushMatrix();
    //translate(EsquerdaDireita, UP/Down, Frente/TRas)
    translate(x, y, z);
    shape(forma);
    noStroke();
    popMatrix();
  }
}
// ------------------------------- Cabeça -------------------------------------------------------------------------

// ------------------------------- Chapéu -------------------------------------------------------------------------
class Chapeu {
  int raio, altura;
  int R, G, B;
  float x, y, z;
  PShape esfera;
  PImage imagem;


  Chapeu(int pRaio, int pH, int pR, int pG, int pB, float pX, float pY, float pZ)
  {
    raio = pRaio;
    altura = pH;
    R = pR;
    G = pG;
    B = pB;
    x = pX;
    y = pY;
    z = pZ;
    esfera = createShape(SPHERE, 20);
    esfera.beginShape(SPHERE);
    esfera.fill(255);    
    esfera.endShape(CLOSE);
    esfera.setStroke(false);
  }

  void desenha_chapeu() {
    // Chapéu
    pushMatrix();
    translate(x, y, z);
    desenhaCilindro();
    popMatrix();

    // Arco do Chapéu
    for (float i = 0; i < 5; i += 0.01){
     arcoChapeu(i);
    }
    
    //pushMatrix();
    //fill(R, G, B);
    //translate(0, -50, 0);
    //rotateX(PI/2);
    //rotateZ(-PI/6);
    //ellipse(0, 0, 250, 250);
    //popMatrix();


    // Easter Egg
    //pushMatrix();
    //translate(0,-210, 0);
    //shape(esfera);
    //popMatrix();
   


    // Detalhes do Chapeu
    criaEsfera(20, 205, 205, 205, 0, -50, 50);
    criaEsfera(20, 205, 205, 205, 0, -210, 0);
    

    // Estrelinha
    desenha_estrela();
  }
  
  void arcoChapeu(float pos){
    pushMatrix();
    fill(R, G, B);
    translate(0, -50 + pos, 0);
    rotateX(PI/2);
    rotateZ(-PI/6);
    ellipse(0, 0, 250, 250);
    popMatrix(); 
  }


  void desenhaCilindro() {
    float angulo = 0;
    int qtd_lados = 64;
    float angulo_incremento = TWO_PI / qtd_lados;  
    PShape lado;
     
    lado = createShape();
    lado.setStroke(false);
    lado.beginShape(QUAD_STRIP);
    lado.fill(R, G, B);
    // Desenha os vertices para cada lado das figuras da base e do topo
    for (int i = 0; i < qtd_lados + 1; i ++) {
      lado.vertex(0, 0, 0);
      lado.vertex(raio * cos(angulo), altura, raio * sin(angulo));
      angulo += angulo_incremento;
    }
    lado.endShape(CLOSE);
    //lado.setTexture(imagem);
    shape(lado);  
  }
  


  void criaEsfera(int raio, int pR, int pG, int pB, int pX, int pY, int pZ) {
    pushMatrix();
    //translate(EsquerdaDireita, UP/Down, Frente/TRas)
    translate(pX, pY, pZ);
    fill(pR, pG, pB);
    noStroke();
    sphere(raio);
    popMatrix();
  }

  void desenha_estrela() {
    pushMatrix();
    translate(0, -90, 63);
    rotate(frameCount / 10);
    fill(255, 255, 255);
    estrela(0, 0, 5, 10, 5); 
    popMatrix();
  }

  void estrela(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
// ------------------------------- Chapéu -------------------------------------------------------------------------

// ------------------------------- Mensagem ------------------------------------------------------------------------
class Mensagem{
  float x, y, z;
  int rgb;
  int text_size;
  float pos_x, pos_y;
  
  String msg;
  
  Mensagem(String pMsg, float pX, float pY, float pZ, int pRGB, int pText_size, float pPos_x, float pPos_y){
    x = pX;
    y = pY;
    z = pZ;
    
    rgb = pRGB;
    
    pos_x = pPos_x;
    pos_y = pPos_y;
    
    text_size = pText_size;
    
    msg = pMsg;
  }
  
  void set_msg(String pMsg){
    msg = pMsg;
  }
  
  void exibe_mensagem(){
    pushMatrix();
    translate(x, y, z);
    fill(rgb);
    textSize(text_size);
    text(msg, pos_x, pos_y);
    popMatrix();
  }
  
  void set_text_size(int tam){
      text_size += tam;
  }
  

}
// ------------------------------- Mensagem ------------------------------------------------------------------------
// ################################################### Classes ####################################################
