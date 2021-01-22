Autor: Vitor de Almeida Silva
 
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
