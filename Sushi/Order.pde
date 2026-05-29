PFont font;
import processing.sound.*;
SoundFile music;

void setup() {
  size(1080, 720);

  Order();
  Orderstuff();
  generateFish();
  generateVeggie();
  generateAmt();
  drawOrderPaper();
  torii();
  drawSides();
  table();
}

void Order() {
  background(245, 235, 220);
  line(240, 0, 240, 720);
  line(840, 0, 840, 720);
  line(360, 100, 360, 400);
  line(720, 100, 720, 400);
  line(360, 100, 720,100);
  line(360, 400, 720,400);
  font = createFont("PapaYo Regular", 32, true);
}
void Orderstuff() {
  stroke(217, 25, 35);
  strokeWeight(4);
  fill(255, 240, 245);
  rect(415, 22, 230, 76);
  stroke(255, 127, 0);
  strokeWeight(2);
  fill(255, 255, 255);
  rect(420, 27, 220, 66);
  noStroke();
  fill(255, 220, 230);
  rect(422, 29, 216, 62);
  textFont(font);
  textAlign(CENTER);
  textSize(28);
  fill(217, 25, 35);
  text("JRS Sushiria", 531, 70);
  fill(255, 127, 0);
  text("JRS Sushiria", 530, 68);
  noStroke();
  fill(173, 216, 230);
  rect(360, 100, 360, 300);
  fill(217,25,35);
  rect(360,100, 360, 50);
}
String[] fishList = {"Tuna", "Salmon", "Crab"};
String[] veggieList = {"Avocado", "Cucumber"};
int Fish, Veggie;
int rollsAmt, fishAmt, veggieAmt;
void generateFish() {
  Fish = int(random(fishList.length));
}
void generateVeggie() {
  Veggie = int(random(veggieList.length));
}
void generateAmt() {
  rollsAmt = int(random(1, 4));
  fishAmt  = int(random(1, 5));
  veggieAmt = int(random(1, 4));
}
void drawOrderPaper() {
  fill(253, 252, 248);
  stroke(210, 205, 195);
  strokeWeight(1);
  rect(250, 120, 200, 252);
  stroke(220, 80, 80, 160);
  line(276, 120, 276, 372);
  stroke(180, 200, 230, 180);
  for (int i = 0; i < 9; i++) {
    line(252, 148 + i * 22, 448, 148 + i * 22);
  }
  
  fill(245, 235, 220);
  noStroke();
  ellipse(261, 146, 8, 8);
  ellipse(261, 246, 8, 8);
  ellipse(261, 346, 8, 8);
  
  textFont(font);
  textAlign(LEFT);
  fill(40, 30, 20);
  textSize(13);
  text("ORDER", 283, 144);
  textSize(12);
  text("Rolls: 1", 283, 166);
  text("Fish: " + fishList[Fish], 283, 188);
  text("   x1" + " pcs", 283, 210);
  text("Veggie: " + veggieList[Veggie], 283, 232);
  text("   x1" + " pcs", 283, 254);
}

String getOrder() {
  String order = "" + fishList[Fish] + ", " + veggieList[Veggie];
  return order;
}

void torii() {
  noStroke();
  fill(192, 57, 43);
  rect(408, 0, 14, 100);
  rect(638, 0, 14, 100);
  rect(380, 0, 300, 14);
  rect(368, 0, 26, 10, 4);
  rect(666, 0, 26, 10, 4);
  fill(231, 76, 60);
  rect(388, 14, 284, 9);
}

void drawSides() {
  for (int x : new int[]{0, 840}) {
    for (int i = 0; i < 720; i += 80) {
      fill(160, 105, 55);
      noStroke();
      rect(x, i, 240, 80);
      
      stroke(120, 75, 35);
      strokeWeight(2);
      line(x, i + 26, x + 240, i + 26);
      line(x, i + 53, x + 240, i + 53);
      line(x + 80, i, x + 80, i + 80);
      line(x + 160, i, x + 160, i + 80);
      
      stroke(90, 50, 20);
      strokeWeight(3);
      line(x, i + 80, x + 240, i + 80);
    }
  }
}

void table() {
  fill(200, 205, 210);
  noStroke();
  quad(240, 480, 840, 480, 840, 400, 240, 400);
  
  fill(170, 175, 180);
  rect(240, 480, 600, 15);
  
  fill(130);
  rect(280, 495, 20, 225);
  rect(780, 495, 20, 225);
}
