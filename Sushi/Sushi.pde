
int startX;
int startY;
int startMillis = 0;

PImage rice;
PImage salmon;
PImage tuna;
PImage crab;
PImage avocado;
PImage cucumber;
PImage carrot;
PImage knife;

String currentIngredient = "";

int fishScore = 0; // int out of 100
int veggieScore = 0; // int out of 100
int riceScore = 0;
int cutScore = 0;
int totalScore = 0;

String gameState = "building";


int fishCount = 0;
int veggieCount = 0;
int previousX;

String chosenFish = "";
String chosenVeggie = "";

Customer customer;

int[] xPositions = new int[100];
int[] yPositions = new int[100];
String[] ingredients = new String[100];
int count = 0;

int[] riceX = new int[5000];
int[] riceY = new int[5000];

int riceCount = 0;
String currentScreen = "order";

boolean startedSwipe = false;
int swipeStartX;

int[] cutX = new int[10];
int cutCount = 0;

void setup() {
  size(1080, 720);
  font = createFont("PapaYo Regular", 32, true);
  startMillis = millis();
  
  rice = loadImage("images/rice.png");
  salmon = loadImage("images/salmon.png");
  tuna = loadImage("images/tuna.png");
  crab = loadImage("images/crab.png");
  avocado = loadImage("images/avocado.png");
  cucumber = loadImage("images/cucumber.png");
  carrot = loadImage("images/carrot.png");
  knife = loadImage("images/knife.png");

  customer = new Customer();
  generateFish();
  generateVeggie();
}

void draw(){
  if (!currentScreen.equals("score")){
  }
  if (currentScreen.equals("score")){
    drawScoreScreen();
  }
  if (currentScreen.equals("sushi")){
    drawSushiScreen();
  } 
  if (currentScreen.equals("order")){
    drawOrderScreen();
  }
  if (!currentScreen.equals("score")){
    drawButtons();
  }
}
void drawSushiScreen(){
  background(2,201,224);
  if (gameState.equals("cutting")){
    drawSushiRolls();
    drawCuts();
    noCursor();
    image(knife, mouseX, mouseY, 80, 80);
  }

  else if (gameState.equals("rolled")){
    drawFinishedPieces();
  }
  else {
    seaweed(); 
 
    // rice bowl
    fill(255);
    circle(190, 184, 100);
    rice = loadImage("images/rice.png");
    image(rice, 142, 133, 100, 100);
    // salmon bowl
    fill(255, 128, 120);
    rect(250, 140, 90, 90);
    salmon = loadImage("images/salmon.png");
    image(salmon, 250, 133, 100, 100);
    // tuna bowl
    fill(214, 34, 64);
    rect(350, 140, 90, 90);
    tuna = loadImage("images/tuna.png");
    image(tuna, 350, 133, 100, 100);
    // crab bowl 
    fill(250, 77, 22);
    rect(450, 140, 90, 90);
    crab = loadImage("images/crab.png");
    image(crab, 450, 133, 100, 100);
    // avocado bowl
    fill(141, 237, 168);
    rect(550, 140, 90, 90);
    avocado = loadImage("images/avocado.png");
    image(avocado, 550, 133, 100, 100);
    // cucumber bowl 
    fill(0, 140, 40);
    rect(650, 140, 90, 90);
    cucumber = loadImage("images/cucumber.png");
    image(cucumber, 650, 133, 100, 100);
    // carrot bowl
    fill(237, 154, 95);
    rect(750, 140, 90, 90);
    carrot = loadImage("images/carrot.png");
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
    if (gameState.equals("ready")){

      fill(255);
      textSize(40);
      textAlign(CENTER);

      text("SWIPE TO ROLL", width/2, 650);
    }
  }
}


void resetGame() {
  count = 0;
  riceCount = 0;
  cutCount = 0;
  fishCount = 0;
  startedSwipe = false;
  veggieCount = 0;
  currentIngredient = "";
  chosenFish = "";
  chosenVeggie = "";
  gameState = "building";
  startMillis = millis();
  customer = new Customer();
  generateFish();
  generateVeggie();
  currentScreen = "order";
}

void drawButtons() {
  if (currentScreen.equals("sushi")) {
    fill(255, 200, 0);   // highlighted when active
  } else {
    fill(255, 255, 255);
  }
  stroke(180, 0, 0);
  strokeWeight(2);
  rect(880, 640, 160, 50, 10);
  fill(0);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Make Sushi", 960, 665);

  if (currentScreen.equals("order")) {
    fill(255, 200, 0);   // highlighted when active
  } else {
    fill(255, 255, 255);
  }
  rect(700, 640, 160, 50, 10);
  fill(0);
  text("See Order", 780, 665);
  
  fill(73, 240, 61);
  rect(520, 640, 160, 50, 10);
  fill(0);
  text("DONE", 600, 665);
}


void mousePressed(){

  // SCREEN BUTTONS

  if (mouseX >= 520 && mouseX <= 680 &&
      mouseY >= 640 && mouseY <= 690){

    setScore();
    currentScreen = "score";
    return;
  }

  if (currentScreen.equals("score")){

    if (mouseX >= 330 && mouseX <= 510 &&
        mouseY >= 560 && mouseY <= 615){

      resetGame();
      return;
    }

    if (mouseX >= 570 && mouseX <= 750 &&
        mouseY >= 560 && mouseY <= 615){

      exit();
      return;
    }
  }

  if (mouseX >= 880 && mouseX <= 1040 &&
      mouseY >= 640 && mouseY <= 690){

    currentScreen = "sushi";
    return;
  }

  if (mouseX >= 700 && mouseX <= 860 &&
      mouseY >= 640 && mouseY <= 690){

    currentScreen = "order";
    return;
  }

  // ONLY RUN SUSHI LOGIC
  // ON SUSHI SCREEN

  if (!currentScreen.equals("sushi")){
    return;
  }

  // YOUR CUTTING MODE

  if (gameState.equals("rolled")){
    return;
  }

  else if (gameState.equals("cutting")){

    if (mouseX >= 200 &&
        mouseX <= 700){

      cutX[cutCount] = mouseX;
      cutCount++;
      
      
      
      if (cutCount >= 5){
        

        gameState = "rolled";

        
        calculateScores();
        setScore();

        currentScreen = "score";

        
        
      }
    }

    return;
  }

  // INGREDIENT SELECTION

  if (150 <= mouseX &&
      mouseX < 240 &&
      mouseY >= 140 &&
      mouseY <= 230){

    currentIngredient = "rice";
  }

  else if (250 <= mouseX &&
           mouseX < 335 &&
           mouseY >= 140 &&
           mouseY <= 230){

    currentIngredient = "salmon";
  }

  else if (350 <= mouseX &&
           mouseX < 435 &&
           mouseY >= 140 &&
           mouseY <= 230){

    currentIngredient = "tuna";
  }

  else if (450 <= mouseX &&
           mouseX < 535 &&
           mouseY >= 140 &&
           mouseY <= 230){

    currentIngredient = "crab";
  }

  else if (550 <= mouseX &&
           mouseX < 635 &&
           mouseY >= 140 &&
           mouseY <= 230){

    currentIngredient = "avocado";
  }

  else if (650 <= mouseX &&
           mouseX < 735 &&
           mouseY >= 140 &&
           mouseY <= 230){

    currentIngredient = "cucumber";
  }

  else if (750 <= mouseX &&
           mouseX < 835 &&
           mouseY >= 140 &&
           mouseY <= 230){

    currentIngredient = "carrot";
  }

  // --------------------------
  // PLACE FOOD
  // --------------------------

  else{

    xPositions[count] = mouseX;
    yPositions[count] = mouseY;
    ingredients[count] = currentIngredient;

    count++;

    if (currentIngredient.equals("salmon") ||
        currentIngredient.equals("tuna") ||
        currentIngredient.equals("crab")){

      chosenFish = currentIngredient;
      fishCount++;
    }

    if (currentIngredient.equals("avocado") ||
        currentIngredient.equals("cucumber") ||
        currentIngredient.equals("carrot")){

      chosenVeggie = currentIngredient;
      veggieCount++;
    }

    if (fishCount >= 5 &&
        veggieCount >= 8){

      gameState = "ready";
    }
  }
}
void mouseDragged(){

  // Only allow sushi interactions on sushi screen
  if (!currentScreen.equals("sushi")){
    return;
  }

  // -------------------------
  // RICE PAINTING
  // -------------------------

  if (currentIngredient.equals("rice")){

    if (mouseX > 220 && mouseX < 780 &&
        mouseY > 320 && mouseY < 480){

      for (int i = 0; i < 8; i++){

        riceX[riceCount] = mouseX + int(random(-8,8));
        riceY[riceCount] = mouseY + int(random(-8,8));

        riceCount++;
      }
    }
  }

  // -------------------------
  // SWIPE TO ROLL
  // -------------------------

  if (gameState.equals("ready")){

    if (!startedSwipe && mouseX < 300){

      startedSwipe = true;
      swipeStartX = mouseX;
    }

    if (startedSwipe && mouseX > 700){

      gameState = "cutting";
    }
  }
}

void mouseReleased(){

  startedSwipe = false;
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

void drawSushiRolls(){

  background(2,201,224);

  int x = 200;
  int y = 360;

  int rollLength = 500;

  // MAIN SEAWEED BODY
  fill(0,128,36);
  rect(x, y - 50, rollLength, 100, 50);

  // LEFT END
  drawRollEnd(x + 20, y);

  fill(255);
  textAlign(CENTER);
  textSize(36);

  text("MAKE 6 SLICES", width/2, 220);

  textSize(24);
  text(cutCount + 1 + " / 6", width/2, 260);
}

void drawRollEnd(int x , int y){

  stroke(0);
  strokeWeight(1);

  // seaweed outside
  fill(0,128,36);
  circle(x, y, 100);

  // rice
  fill(255);
  circle(x, y, 80);

  // fish filling
  if (chosenFish.equals("salmon")){
    fill(255,128,120);
  }

  else if (chosenFish.equals("tuna")){
    fill(214,34,64);
  }

  else if (chosenFish.equals("crab")){
    fill(250,77,22);
  }

  ellipse(x - 10, y, 30, 50);

  // veggie filling
  if (chosenVeggie.equals("avocado")){
    fill(141,237,168);
  }

  else if (chosenVeggie.equals("cucumber")){
    fill(0,140,40);
  }

  else if (chosenVeggie.equals("carrot")){
    fill(237,154,95);
  }

  ellipse(x + 15, y, 25, 40);
}

void drawCuts(){

  stroke(255);
  strokeWeight(4);

  for(int i = 0; i < cutCount; i++){

    line(
      cutX[i],
      290,
      cutX[i],
      430
    );
  }
}

void drawFinishedPieces(){

  background(2,201,224);

  for (int i = 0; i < 5; i++){

    int x = 200 + i * 130;
    int y = 350;

    // seaweed outside
    fill(0,128,36);
    circle(x, y, 100);

    // rice
    fill(255);
    circle(x, y, 80);

    // fish center
    if (chosenFish.equals("salmon")){
      fill(255,128,120);
    }

    else if (chosenFish.equals("tuna")){
      fill(214,34,64);
    }

    else if (chosenFish.equals("crab")){
      fill(250,77,22);
    }

    ellipse(x - 10, y, 30, 50);

    // veggie center
    if (chosenVeggie.equals("avocado")){
      fill(141,237,168);
    }

    else if (chosenVeggie.equals("cucumber")){
      fill(0,140,40);
    }

    else if (chosenVeggie.equals("carrot")){
      fill(237,154,95);
    }

    ellipse(x + 15, y, 25, 40);
  }
}

void calculateScores(){
 
  calculateFishScore();

  calculateVeggieScore();
  
  calculateRiceScore();


  calculateCutScore();
  
  totalScore =
    (fishScore +
     veggieScore +
     riceScore +
     cutScore) / 4;
    
     
}

void calculateFishScore(){

  int[] idealFishX = {
    250,
    375,
    500,
    625,
    750
  };

  float totalError = 0;
  int fishIndex = 0;

  for(int i = 0; i < count; i++){

    if(
      ingredients[i].equals("salmon") ||
      ingredients[i].equals("tuna") ||
      ingredients[i].equals("crab")
    ){

      if(fishIndex < 5){

        totalError += abs(
          xPositions[i] - idealFishX[fishIndex]
        );

        fishIndex++;
      }
    }
  }

  float avgError = totalError / 5.0;

  fishScore =
    int(max(
      0,
      100 - (avgError / 100.0) * 100
    ));
}

void calculateVeggieScore(){

  int[] idealVeggieX = {
    225,
    300,
    375,
    450,
    525,
    600,
    675,
    750
  };

  float totalError = 0;
  int veggieIndex = 0;

  for(int i = 0; i < count; i++){

    if(
      ingredients[i].equals("avocado") ||
      ingredients[i].equals("cucumber") ||
      ingredients[i].equals("carrot")
    ){

      if(veggieIndex < 8){

        totalError += abs(
          xPositions[i] - idealVeggieX[veggieIndex]
        );

        veggieIndex++;
      }
    }
  }
  
  float avgError = totalError / 8.0;


  veggieScore =
    int(max(
      0,
      100 - (avgError / 100.0) * 100
    ));
}

void calculateRiceScore(){

  riceScore =
    int(min(
      100,
      (riceCount * 100.0) / 2500
    ));
}

void calculateCutScore(){
 
  if(cutCount != 5){
   
    cutScore = 0;
    return;
  }
 
  int[] idealCuts = {
    300,
    400,
    500,
    600,
    700
  };

  float totalError = 0;

  for(int i = 0; i < 5; i++){

    totalError += abs(
      cutX[i] - idealCuts[i]
    );
  }
 
  float avgError = totalError / 5.0;
 
  cutScore =
    int(max(
      0,
      100 - avgError
    ));
    
}



int getFishScore(){
  return fishScore;
}

int getVeggieScore(){
  return veggieScore;
}

int getRiceScore(){
  return riceScore;
}

int getCutScore(){
  return cutScore;
}

int getTotalScore(){
  return totalScore;
}
