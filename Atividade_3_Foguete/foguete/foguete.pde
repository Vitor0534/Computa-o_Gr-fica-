/*
 Foguete 3D com Processing
 Alunos: Higor Alvez Ferreira;
         Lucas Macedo da Silva;
         Vitor de Almeida Silva;
         
         
Função: desenha_cilindro adapatada de Reas e Fry (2007)
  
As operações de rotação e escala foram implementadas baseando-se no ponteiro e no scrool do mouse
      
      Rotação: 
      *rotateX: utiliza o mapeamento do ponteiro do mouse para rotacionar no eixo x
      *rotateY: utiliza o mapeamento do ponteiro do mouse para rotacionar no eixo y
      
      Escala:
      *mouseWheel(MouseEvent event): essa função utiliza do objeto mouseEvent, que permite coletar informações do scrool
                                     o scrool retonar (-1) giro para frente ou (1) giro para tráz. esse valor é somado em uma
                                     variável a qual altera o valor do eixo z na função translate, com isso o objeto se aproxima 
                                     ou distancia da câmera.  
*/

PImage imagem;
float newZmag=0;

void setup() {
  size(500,500,P3D);
  imagem = loadImage("image.jpg");
  
}

void draw(){
  
  background(imagem);                            // fundo preto
  lights();                                 // Luzes 
  translate(width/2, height/2, newZmag);             // Mudando a origem do sistema de coordenadas para o meio da tela
                                                     // A variável newZmag sofre efeito do scrool do mouse alterando o valor de posicionamento
                                                     //do objeto no eixo z, desse modo provocando o efeito de zoom

  
  
  noStroke();
  
  fill(0, 0, 180);                      // Cor da forma
  // Propursor do foguete
  translate(0, -40, 0);
  desenha_cilindro(70, 100, 200, 4);

  fill(255, 255, 255);                      // Cor da forma
  // Cilindro do meio do foguete 
  translate(0, -40, 0);
  desenha_cilindro(70, 70, 200, 64);
  
  //Cone de cima do foguete 
  translate(0, -80, 0);
  desenha_cilindro(0, 70, 80, 64);  
}


void desenha_cilindro(float raio_cima, float raio_baixo, float altura, int qtd_lados){
    /*
      Desenha um cilindro ou outra forma dependendo da quantidade de lados.
      Para isso, usa a função beginShape, vertex e endShape.    
    */
    float angulo = 0;
    float angulo_incremento = TWO_PI / qtd_lados;
    
    beginShape(QUAD_STRIP);    // Método usado para iniciar uma forma personalizada
    // Desenha os vertices para cada lado das figuras da base e do topo
    for (int i = 0; i < qtd_lados + 1; i ++){
       //vertex(x, y, z)
       vertex(raio_cima * cos(angulo), 0, raio_cima * sin(angulo));
       vertex(raio_baixo * cos(angulo), altura, raio_baixo * sin(angulo));
       angulo += angulo_incremento;
    }
    
    endShape();
    
    if (raio_cima != 0){
      angulo = 0;
      
      beginShape(TRIANGLE_FAN);
      vertex(0, 0, 0);
      for (int i = 0; i < qtd_lados + 1; i ++){
        vertex(raio_cima * cos(angulo), 0, raio_cima * sin(angulo));
        angulo += angulo_incremento;
      }
      endShape();
      
    }
    
    if (raio_baixo != 0){
      angulo = 0;
      
      beginShape(TRIANGLE_FAN);
      vertex(0, altura, 0);
      for (int i = 0; i < qtd_lados + 1; i ++){
        vertex(raio_baixo * cos(angulo), altura, raio_baixo * sin(angulo));
        angulo += angulo_incremento;
      }
      endShape();
      
    }
    
}


//fução que capitura a mudança de valor do scrool do mouse usei para zoom (eixo z)
void mouseWheel(MouseEvent event) {
  newZmag+= -event.getCount()*6;         //oque ocorre é uma soma de valores vindos do scrool
}

//essa função funciona orientada ao evento do scrool, ela interrompe o processo para atualizar o valor
//retornado por ele


/*
Referencias:
  REAS, Casey; FRY, Ben. Processing: a programming handbook for visual designers and artists. Massachusetts: The Mit Press, 2007.
*/
