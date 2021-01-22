/*
 Autor: Vitor de almeida silva
 
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
