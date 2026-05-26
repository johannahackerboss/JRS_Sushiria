int startX;
int startY;
PImage rice;
PImage salmon;
PImage tuna;
PImage crab;
PImage avocado;
PImage cucumber;
PImage carrot;
String currentFish = "";
String currentVeggie = "";
int fishScore = 0; // int out of 100
int veggieScore = 0; // int out of 100

void setup() {
  size(1080, 720);
  background(2,201,224);
  
  // rice bowl
  fill(255);
  circle(190, 184, 100);
  rice = loadImage("rice.png");
  image(rice, 142, 133, 100, 100);
  // salmon bowl
  fill(255, 128, 120);
  rect(250, 140, 90, 90);
  salmon = loadImage("salmon.png");
  image(salmon, 250, 133, 100, 100);
  // tuna bowl
  fill(214, 34, 64);
  rect(350, 140, 90, 90);
  tuna = loadImage("tuna.png");
  image(tuna, 350, 133, 100, 100);
  // crab bowl 
  fill(250, 77, 22);
  rect(450, 140, 90, 90);
  crab = loadImage("crab.png");
  image(crab, 450, 133, 100, 100);
  // avocado bowl
  fill(141, 237, 168);
  rect(550, 140, 90, 90);
  avocado = loadImage("avocado.png");
  image(avocado, 550, 133, 100, 100);
  // cucumber bowl 
  fill(0, 140, 40);
  rect(650, 140, 90, 90);
  cucumber = loadImage("cucumber.png");
  image(cucumber, 650, 133, 100, 100);
  // carrot bowl
  fill(232, 115, 0);
  rect(750, 140, 90, 90);
  carrot = loadImage("carrot.png");
  image(carrot, 750, 150, 80, 80);
  seaweed();
  
  
  //rice();
  //salmon();
  //tuna();
  //crab();
  //avocado();
  //cucumber();
  //carrot();
}

void mousePressed(){
  startX = mouseX;
  startY = mouseY;
  
  if (150 <= startX && startX < 200 && startY >= 140 && startY <= 230){
    rice();
  }
  if (250 <= startX && startX < 335 && startY >= 140 && startY <= 230){
    salmon();
    currentFish = "salmon";
  }
  if (350 <= startX && startX < 435 && startY >= 140 && startY <= 230){
    tuna();
    currentFish = "tuna";
  }
  if (450 <= startX && startX < 535 && startY >= 140 && startY <= 230){
    crab();
    currentFish = "crab";
  }
  if (550 <= startX && startX < 635 && startY >= 140 && startY <= 230){
    avocado();
    currentVeggie = "avocado";
  }
  if (650 <= startX && startX < 735 && startY >= 140 && startY <= 230){
    cucumber();
    currentVeggie = "cucumber";
  }
  if (750 <= startX && startX < 835 && startY >= 140 && startY <= 230){
    carrot();
    currentVeggie = "carrot";
  }
  
  
}

void seaweed(){
  startX = 200;
  startY = 300;
  fill(0,128,36);
  rect(startX,startY,600,200);
  
}

void rice(){

  fill(255);
  ellipse(startX, startY, 50, 25);


}

void salmon(){
  fill(255, 128, 120);

  rect(startX,startY,100,200);
  stroke(255);
  strokeWeight(8);
  line(startX + 10, startY + 10, startX + 90 , startY + 90);
  line(startX + 10, startY + 50, startX + 90 , startY + 140);
  line(startX + 10, startY + 90, startX + 90 , startY + 180);
}

void tuna(){
  fill(214, 34, 64);

  rect(startX,startY,100,200);
  stroke(247, 81, 109);
  strokeWeight(8);
  line(startX + 10, startY + 10, startX + 90 , startY + 90);
  line(startX + 10, startY + 50, startX + 90 , startY + 140);
  line(startX + 10, startY + 90, startX + 90 , startY + 180);
}

void crab(){
  fill(250, 77, 22);

  rect(startX,startY,100,200);
  fill(255);
  rect(startX + 90,startY,10,200);
  ellipse(startX + 50, startY + 200, 100, 25);
}

// VEGGIES

void avocado(){
  fill(0, 140, 40);

  arc(startX + 50, startY + 100, 120, 200, PI/2, (3* PI)/2);
  fill(141, 237, 168);
  arc(startX + 50, startY + 96, 100, 180, PI/2, (3* PI)/2);
}

void carrot(){
  fill(232, 115, 0);

  rect(startX,startY,20,200);
  fill(255, 149, 0);
  rect(startX + 20, startY + 40, 40, 160);
  triangle(startX + 20, startY, startX + 60, startY + 40, startX + 20, startY + 40);
 
}

void cucumber(){
  fill(0, 140, 40);

  rect(startX,startY,20,200);
  fill(141, 237, 168);
  triangle(startX + 20, startY, startX + 60, startY + 40, startX + 20, startY + 40);
  rect(startX + 20, startY + 40, 40, 160);
  fill(255);
  ellipse(startX + 35, startY + 50, 15, 10);
  ellipse(startX + 35, startY + 70, 15, 10);
  ellipse(startX + 35, startY + 90, 15, 10);
  ellipse(startX + 35, startY + 110, 15, 10);
  ellipse(startX + 35, startY + 130, 15, 10);
  ellipse(startX + 35, startY + 150, 15, 10);
  ellipse(startX + 35, startY + 170, 15, 10);
}
