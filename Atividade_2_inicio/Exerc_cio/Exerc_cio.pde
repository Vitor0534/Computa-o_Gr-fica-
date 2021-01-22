float xmag, zmag=0, ymag = 0;
float newXmag,newZmag , newYmag = 0; 
 
void setup()  { 
  size(640, 360, P3D); 
  stroke(0);            //função que par colocar os traços no desenho Stroke(R,G,B);

} 
 
void draw()  { 
  background(50,60,100);   //essa função estando no loop impede o aparecimento de "fantasmas"
   
  translate(width/2, height/2, newZmag ); 
  
  newXmag = mouseX/float(width) * TWO_PI; 
  newYmag = mouseY/float(height) * TWO_PI;
  //eixo z é controlado pelo mouse
  
  float diff = xmag-newXmag;     //cálculo realizado fazendo a diferentça da posição incial com a atual            
  if (abs(diff) >  0.01) {      //para saber o valor do movimento
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  rotateX(-ymag);                 //roda a figura de acordo com a posição do ponteiro do mouse
  rotateY(-xmag); 
  
  box(90);
} 


//fução que capitura a mudança de valor do scrool do mouse usei para zoom (eixo z)
void mouseWheel(MouseEvent event) {
  newZmag+= -event.getCount()*6;         //oque ocorre é uma soma de valores vindos do scrool
}
//essa função funciona orientada ao evento do scrool, ela interrompe o processo para atualizar o valor
//retornado por ele
