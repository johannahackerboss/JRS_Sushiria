int startX;
int startY;
PImage rice;
PImage salmon;
PImage tuna;
PImage crab;
PImage avocado;
PImage cucumber;
PImage carrot;
String currentIngredient = "";
int fishScore = 0; // int out of 100
int veggieScore = 0; // int out of 100

int[] xPositions = new int[100];
int[] yPositions = new int[100];
String[] ingredients = new String[100];
int count = 0;

int[] riceX = new int[5000];
int[] riceY = new int[5000];

int riceCount = 0;

void setup() {
  size(1080, 720);
  background(2,201,224);
  

  
  
  //rice();
  //salmon();
  //tuna();
  //crab();
  //avocado();
  //cucumber();
  //carrot();
}

void draw(){
  background(2,201,224);

  seaweed();
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
  fill(237, 154, 95);
  rect(750, 140, 90, 90);
  carrot = loadImage("carrot.png");
  image(carrot, 750, 150, 80, 80);
  //seaweed();
  for (int i = 0; i < riceCount; i++){
    rice(riceX[i], riceY[i]);
  }
  // now redraws every drawn ingredient 
  for (int i = 0; i < count; i++){

    startX = xPositions[i];
    startY = yPositions[i];

    if (ingredients[i].equals("salmon")){
      salmon();
    }

    else if (ingredients[i].equals("tuna")){
      tuna();
    }

    else if (ingredients[i].equals("crab")){
      crab();
    }

    else if (ingredients[i].equals("avocado")){
      avocado();
    }

    else if (ingredients[i].equals("cucumber")){
      cucumber();
    }

    else if (ingredients[i].equals("carrot")){
      carrot();
    }
  }
}

void mousePressed(){

  // SALMON BOWL
  if (150 <= mouseX && mouseX < 240 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "rice";
  }
  else if (250 <= mouseX && mouseX < 335 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "salmon";
  }

  // TUNA BOWL
  else if (350 <= mouseX && mouseX < 435 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "tuna";
  }

  // CRAB BOWL
  else if (450 <= mouseX && mouseX < 535 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "crab";
  }

  // AVOCADO BOWL
  else if (550 <= mouseX && mouseX < 635 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "avocado";
  }

  // CUCUMBER BOWL
  else if (650 <= mouseX && mouseX < 735 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "cucumber";
  }

  // CARROT BOWL
  else if (750 <= mouseX && mouseX < 835 && mouseY >= 140 && mouseY <= 230){
    currentIngredient = "carrot";
  }

  // OTHERWISE PLACE THE FOOD
  else {

    xPositions[count] = mouseX;
    yPositions[count] = mouseY;
    ingredients[count] = currentIngredient;

    count++;
  }
}
void mouseDragged(){

  if (currentIngredient.equals("rice")){

    // only place rice on seaweed
    if (mouseX > 220 && mouseX < 780 &&
        mouseY > 320 && mouseY < 480){

      riceX[riceCount] = mouseX + int(random(-8,8));
      riceY[riceCount] = mouseY + int(random(-8,8));

      riceCount++;
    }
  }
}
void seaweed(){
  stroke(0);
  strokeWeight(1);
  startX = 200;
  startY = 300;
  fill(0,128,36);
  rect(startX,startY,600,200);
  
}

void rice(int x, int y){
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(x, y, 50, 25);


}

void salmon(){
  fill(255, 128, 120);
  stroke(255);
  strokeWeight(8);
  rect(startX,startY,100,200);
  line(startX + 10, startY + 10, startX + 90 , startY + 90);
  line(startX + 10, startY + 50, startX + 90 , startY + 140);
  line(startX + 10, startY + 90, startX + 90 , startY + 180);
}

void tuna(){
  stroke(0);
  strokeWeight(1);
  fill(214, 34, 64);

  rect(startX,startY,100,200);
  stroke(247, 81, 109);
  strokeWeight(8);
  line(startX + 10, startY + 10, startX + 90 , startY + 90);
  line(startX + 10, startY + 50, startX + 90 , startY + 140);
  line(startX + 10, startY + 90, startX + 90 , startY + 180);
}

void crab(){
  stroke(0);
  strokeWeight(1);
  fill(250, 77, 22);

  rect(startX,startY,100,200);
  fill(255);
  rect(startX + 90,startY,10,200);
  ellipse(startX + 50, startY + 200, 100, 25);
}

// VEGGIES

void avocado(){
  stroke(0);
  strokeWeight(1);
  fill(0, 140, 40);

  arc(startX + 50, startY + 100, 120, 200, PI/2, (3* PI)/2);
  fill(141, 237, 168);
  arc(startX + 50, startY + 96, 100, 180, PI/2, (3* PI)/2);
}

void carrot(){
  stroke(0);
  strokeWeight(1);
  fill(232, 115, 0);

  rect(startX,startY,20,200);
  fill(255, 149, 0);
  rect(startX + 20, startY + 40, 40, 160);
  triangle(startX + 20, startY, startX + 60, startY + 40, startX + 20, startY + 40);
 
}

void cucumber(){
  stroke(0);
  strokeWeight(1);
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
>>>>>>> origin/Sushi
