PFont font;
void setup() {
  size(1080, 720);
  background(255, 179, 222);
  line(240, 0, 240, 720);
  line(840, 0, 840, 720);
  line(360, 100, 360, 400);
  line(720, 100, 720, 400);
  line(360, 100, 720,100);
  line(360, 400, 720,400);
  font = createFont("PapaYo Regular", 32, true);
}

void draw() {
  fill(255);
  rect(430, 40, 200, 60);
  textFont(font);
  fill(255,127,0);
  text("JRS Sushiria", 440, 80);
  fill(255);
  rect(360, 100, 360, 300);
  fill(217,25,35);
  rect(360,100, 360, 50);
  
}

String[] fishList = {"Tuna", "Salmon"};
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
  fishAmt  = int(random(1, 4));
  veggieAmt = int(random(1, 4));
}
