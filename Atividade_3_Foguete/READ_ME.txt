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
