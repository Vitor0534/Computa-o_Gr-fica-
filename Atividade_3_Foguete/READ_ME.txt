/*
 Foguete 3D com Processing
 Alunos: Higor Alvez Ferreira;
         Lucas Macedo da Silva;
         Vitor de Almeida Silva;
         
         
Fun��o: desenha_cilindro adapatada de Reas e Fry (2007)
  
As opera��es de rota��o e escala foram implementadas baseando-se no ponteiro e no scrool do mouse
      
      Rota��o: 
      *rotateX: utiliza o mapeamento do ponteiro do mouse para rotacionar no eixo x
      *rotateY: utiliza o mapeamento do ponteiro do mouse para rotacionar no eixo y
      
      Escala:
      *mouseWheel(MouseEvent event): essa fun��o utiliza do objeto mouseEvent, que permite coletar informa��es do scrool
                                     o scrool retonar (-1) giro para frente ou (1) giro para tr�z. esse valor � somado em uma
                                     vari�vel a qual altera o valor do eixo z na fun��o translate, com isso o objeto se aproxima 
                                     ou distancia da c�mera.  
*/