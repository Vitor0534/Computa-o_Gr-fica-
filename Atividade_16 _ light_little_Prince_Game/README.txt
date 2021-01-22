Autor: Vitor de Almeida Silva
 
 Titulo: The little prince in the Flat earth�s game
 
 Sobre o programa:  
 
      Foi produzido um jogo nomeado de  "The little prince in the Flat earth�s game", cujo o objetivo � mostrar o funcionamento de algumas primitivas de luz presentes no processing, assim como,
 algumas primitivas de controle da camera, s�o elas:
 
      * ambientLight(255, 255, 255): configura uma luz ambiente RGB que � distribuida uniformemente nos objetos sem ponto espec�fico
                                     n�o tem forma��o de sombras;
 
      * directionalLight(R, G, B, left, right, up): produz uma luz direcional RGB, que parte de um ponto especificado, essa luz produz
                                                    efeitos de sombra. no caso ela foi utilizada em conjunto com a luz ambiente para
                                                    produzir mais realismo ao cen�rio e para gerar uma melhor visualiza��o dos objetos;
 
      * camera(A, B, C, X, Y, Z, 0.0, 1.0, 0.0): Essa fun��o controla a posi��o da camera, de modo que tem os seguintes par�metros:
                                                 * (A,B,C)= s�o parametros que control�o a posi��o dos olhos na camera
                                                            produzem um efeito de "andar" pelo cen�rio para a aplica��o em quest�o;
                                                 * (X,Y,Z)= controlam posi��es de altura, esquerda e direita do ponto de vista da camera
                                                            (est�o configurados com valores fixos);
                                                 * os demais parametros controlam orienta��o de rota��o da camera, e s�o geralmente
                                                   comfigurados com (0.0,1.0,0.0);
      * perspective(): essa primitiva aumenta a sensa��o de perspectiva da cena com os objetos, usando a posi��o da camera e a dist�ncia entre os objetos 
                       para melhorar a ilus�o de distancia e ponto de perspectiva;
 
      * printCamera(): Essa primitiva imprime no terminal do processing as coordenadas da camera naquele momento;
      
      * lightFalloff(1.0, 0.001, 0.0): simula um tipo de degrad� calculado por meio da distancia do ponto de luz em uma superf�cie.
 
      O jogo consiste de um cen�rio e um personagem, sendo este, uma par�dia das teorias de terra plana e do livro o pequeno principe, j� que o personagem vive
 em um planetinha pequeno no espa�o. As primitivas do processing produzem os efeitos de Luz, sombra e posi��o da c�mera para dar mais realidade 
 ao ambiente.
      O jogo consiste, basicamente, de controlar o personagem representado por um tipo de caixa retangular 3D amarela, podendo alterar posi��o de camera, ponto de luz
 e rota��o do cen�rio no eixo Z, bastanto para isso, somente mover o mouse.  Tamb�m � poss�vel interagir com 3 bot�es dispostos no piso na frente das casa, ao posicionar o personagem em cima dos bot�es, os mesmos mudam de cor entre R
 , G ou B. Os controles s�o os seguintes:
 
       * Controles de camera:  
         - Eixo X =  teclas 4 e 6;
         - Eixo Y =  teclas 8 e 2;
         - Eixo Z =  teclas 7 e 9;
 
       * Controles da posi��o da Luz:  
         - Eixo X =  teclas a e d;
         - Eixo Y =  teclas w e s;
         - Eixo Z =  teclas q e e;
         
       * Controles da rota��o do cen�rio:
         - Eixo Z mouse: movimente a seta do mouse por cima da tela para realizar uma rota��o no eixo Z de todo o cen�rio
                         Repare que isso n�o autera a posi��o da luz,  por�m, altera a orienta��o do cen�rio, por isso
                         a posi��o das sombras ir� mudar;
 
       * Controles do personagem:  
         - Eixo X =  teclas j e l;
         - Eixo Y =  teclas i e k;
     
 OBS_1: Um desafio encontrado, foi gerar a sombra de um objeto em cima de outro objeto, sendo necessario, para isso, trabalhar com texturas e calculos de 
        posi��o de sombra e shaders. Deste modo, essa parte foi deixada de lado, utilizando somente as primitivas de luz e sombra comuns do processing;
 OBS_2: conforme se movimenta o ponto de luz � possivel visualizar o efeito de sombra gerados automaticamente pelo processing. Da mesma forma, � poss�vel
        visualizar o cen�rio em diferentes angulos, controlando a camera e a rota��o do cen�rio;
