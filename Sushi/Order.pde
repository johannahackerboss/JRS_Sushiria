PFont font;


void setup() {
  size(1080, 720);
  Order();
  Orderstuff();
  generateFish();
  generateVeggie();
  generateAmt();
//  drawOrderPaper();
}

void Order() {
  background(255, 179, 222);
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
  fill(255);
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
  fill(200, 190, 180, 80);
  noStroke();
  rect(258, 418, 204, 256);
  fill(253, 252, 248);
  stroke(210, 205, 195);
  strokeWeight(1);
  rect(250, 410, 200, 252);
  stroke(220, 80, 80, 160);
  line(276, 410, 276, 662);
  stroke(180, 200, 230, 180);
  for (int i = 0; i < 9; i++) {
    line(252, 438 + i * 22, 448, 438 + i * 22);
  }
  fill(255, 179, 222);
  noStroke();
  ellipse(261, 436, 8, 8);
  ellipse(261, 536, 8, 8);
  ellipse(261, 636, 8, 8);
  textFont(font);
  textAlign(LEFT);
  fill(40, 30, 20);
  textSize(13);
  text("ORDER", 283, 434);
  textSize(12);
  text("Rolls: " + rollsAmt, 283, 456);
  text("Fish: " + fishList[Fish], 283, 478);
  text("  x" + fishAmt + " pcs", 283, 500);
  text("Veggie: " + veggieList[Veggie], 283, 522);
  text("  x" + veggieAmt + " pcs", 283, 544);
}
