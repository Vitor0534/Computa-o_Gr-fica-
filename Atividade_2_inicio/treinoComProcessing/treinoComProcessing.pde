float x,y,z;
float passo=0;
void setup() {
size(600,600,P3D);   //especifica o tamanho da janela é o formato da figura 3d/2d
background(100);     //colore a cor do plano de fundo (0- preto até 255-branco)


x = width/2;        //eixo x
y = height/2;      //eixo y 
z = 0;             //eixo z
}

//função draw fica em loop constante
void draw() {
translate(x,y,z);    //função capaz de mover a figura nos eixos
rectMode(CENTER);    //define a posição no plano onde a figura vai iniciar

rotateZ(passo);       //função capaz de girar a figura no eixo z
rotateX(passo);       //função capaz de girar a figura no eixo x
rotateY(passo);       //função capaz de girar a figura no eixo y

rect(0,0,100,100);   //desenha um retangulo nas dimençoes (x,y,comprimento,altura)

z++; // The rectangle moves forward as z increments.
//x--;
passo+=0.5;

}
