/*
 Autor: Vitor de almeida silva
 
 O presente programa, tem o prop�sito de mostrar um exemplo da utiliza��o das fun��es de rederiza��o do processing,
 para tanto, � proposto um jogo "coloring your own robot game :D". Tal jogo consiste da produ��o de uma paleta de cores em camada,
 a qual, colore cada parte de um objeto "Rob�" quando est� for posicionado acima da paleta.  
 
   Desta forma, foi definido um objeto composto por 6 outros objetos rect, tal objeto representa a figura de um rob�. o objetivo do programa,
 � que o usu�rio possa colorir cada parte do rob� utilizando a paleta de cores RGB. 
 
 Como funciona:
 
   * � poss�vel organizar cores R, G, B modicando os valores nas slide bars na base ta tela;
   * Para selecionar um objeto, basta clicar sobre o mesmo e arrasta-lo, a CAMADA do objeto � indicada
     em uma label na parte superior da tela;
   * Quando o objeto passar por cima da paleta de cores, o mesmo ser� colorido da mesma cor da paleta.
 
 OBS1: Em termos das primitivas, foram utilizadas as seguintes:
 
   * PGraphics : essa primitiva cria uma layer nova, de modo que, possa ser tratada individualmente. 
                 essa layer pode ser imaginada como uma nova superficeie na tela, com dimens�es definidas
                 que pode ser tratada de forma individual; 
 
   * Tint(a,b) : configura a transparencia do objeto em um intervalo definido em "a" (255) controlado por "b". 
                 essa fun��o foi utilizada para tornas os objetos um pouco transparentes, de modo que, seja poss�vel visualizar a sobreposi��o das camadas;
 
   * blendMode(BLEND): Essa primitiva tem a funcionalidade de combinar as cores entre as camadas, ela fornece diversos tipos de op��es de blend, sendo que a escolhida
                       foi a fun��o padr�o:
                             - BLEND: interpola��o linear de cores C=A*factor+B. � a op��o padr�o da primitiva blendMod();      
                       Essa fun��o � utilizada para fornecer uma combina��o suave entre as cores quando as camadas estiverem se sobrepondo.

 OBS2: da maneira que o programa foi organizado, o mouse vai selecionar sempre a camada que estiver abaixo da outra, isto �, se o mouse
       estiver sobre a camada 2, por exemplo, e ela sobrepor em uma certa regi�o na camada 1 a camada 1 ser� selecionada.
       
 OBS3: a paleta de cores, tanto quanto as slide bars, est�o na camada principal da janela, os outros objetos est�o em camadas diferentes.
 
 */
