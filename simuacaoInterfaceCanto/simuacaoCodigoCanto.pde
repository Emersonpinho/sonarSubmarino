// ===== Radar Simulado em Processing =====
// Não precisa de Arduino nem porta serial

// Variáveis globais
String angle="";
String distance="";
String data="";
String noObject;
float pixsDistance;
int iAngle, iDistance;
PFont orcFont;

float radarSize; // tamanho do radar baseado no menor lado da tela
float radarY;    // posição Y do centro do radar

void setup() {
  size (1920, 1080); // ***ajuste para sua tela***
  smooth();
  orcFont = createFont("Arial", 25); // troquei para Arial caso não tenha CorbelLight
  radarSize = min(width, height) * 0.95;
  radarY = height - radarSize/2 - 20; // centralizado embaixo sem cortar
}

void draw() {
  simulateData(); // <-- gera ângulo e distância automaticamente
  
  fill(98,245,31);
  textFont(orcFont);

  // efeito de "motion blur" no fundo
  noStroke();
  fill(0,4); 
  rect(0, 0, width, height-height*0.065); 

  fill(98,245,31); // verde radar
  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

// ====================================================
// SIMULAÇÃO DE DADOS (substitui o Arduino + Serial)
// ====================================================
boolean indo = true; // controla ida e volta do "servo"

void simulateData() {
  // simula ângulo de 15° a 165° (igual ao servo do Arduino)
  if (indo) {
    iAngle++;
    if (iAngle >= 165) indo = false;
  } else {
    iAngle--;
    if (iAngle <= 15) indo = true;
  }
  
  // simula distância entre 5 e 50 cm
  iDistance = int(random(5, 50));
}

// ====================================================
// FUNÇÕES DE DESENHO
// ====================================================
void drawRadar() {
  pushMatrix();
  translate(width/2, radarY);
  noFill();
  strokeWeight(2);
  stroke(98,245,31);

  // círculos
  arc(0,0, radarSize, radarSize, PI, TWO_PI);
  arc(0,0, radarSize*0.75, radarSize*0.75, PI, TWO_PI);
  arc(0,0, radarSize*0.55, radarSize*0.55, PI, TWO_PI);
  arc(0,0, radarSize*0.35, radarSize*0.35, PI, TWO_PI);

  // linhas divisórias
  for (int ang=0; ang<=180; ang+=30) {
    line(0,0, (radarSize/2)*cos(radians(ang)), -(radarSize/2)*sin(radians(ang)));
  }
  popMatrix();
}

void drawObject() {
  pushMatrix();
  translate(width/2, radarY);
  strokeWeight(9);
  stroke(255,10,10); // vermelho
  pixsDistance = iDistance * (radarSize/80.0); // escala proporcional
  if(iDistance < 40){
    line(pixsDistance*cos(radians(iAngle)),-pixsDistance*sin(radians(iAngle)),
         (radarSize*0.35/2)*cos(radians(iAngle)),-(radarSize*0.35/2)*sin(radians(iAngle)));
  }
  popMatrix();
}

void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30,250,60);
  translate(width/2, radarY);
  line(0,0,(radarSize/2)*cos(radians(iAngle)),
           -(radarSize/2)*sin(radians(iAngle)));
  popMatrix();
}

void drawText() {
  pushMatrix();
  if(iDistance>40) {
    noObject = "Out of Range";
  } else {
    noObject = "In Range";
  }
  fill(0,0,0);
  noStroke();
  rect(0, height-height*0.0648, width, height);
  fill(98,245,31);
  textSize(25);

  text("10cm", width*0.62, height-height*0.0833);
  text("20cm", width*0.72, height-height*0.0833);
  text("30cm", width*0.82, height-height*0.0833);
  text("40cm", width*0.92, height-height*0.0833);

  textSize(40);
  text("Object: " + noObject, width*0.12, height-height*0.0277);
  text("Angle: " + iAngle +" °", width*0.45, height-height*0.0277);
  text("Distance: " + (iDistance<40 ? iDistance+" cm" : ""), width*0.70, height-height*0.0277);

  // ângulos
  textSize(25);
  fill(98,245,60);

  placeText("30°", 30);
  placeText("60°", 60);
  placeText("90°", 90);
  placeText("120°", 120);
  placeText("150°", 150);

  popMatrix(); 
}

// Função auxiliar para posicionar texto dos ângulos
void placeText(String label, int ang) {
  pushMatrix();
  translate(width/2 + (radarSize/2)*cos(radians(ang)), 
            radarY - (radarSize/2)*sin(radians(ang)));
  fill(98,245,60);
  text(label, 0, 0);
  popMatrix();
}
