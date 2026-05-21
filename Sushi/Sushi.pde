
void setup() {
  size(1080, 720);
  background(2,201,224);
  seaweed();
  rice();
  salmon();
}

void seaweed(){
  int startX = 200;
  int startY = 300;
  fill(0,128,36);
  rect(startX,startY,600,200);
  
}

void rice(){
  int startX = 200;
  int startY = 300;
  fill(255);
  ellipse(startX, startY, 50, 25);


}

void salmon(){
  fill(255, 128, 120);
  int startX = 200;
  int startY = 300;
  rect(startX,startY,100,200);
  stroke(255);
  strokeWeight(8);
  line(startX + 10, startY + 10, startX + 90 , startY + 90);
  line(startX + 10, startY + 50, startX + 90 , startY + 140);
  line(startX + 10, startY + 90, startX + 90 , startY + 180);
}

void tuna(){
  fill(214, 34, 64);
  int startX = 200;
  int startY = 300;
  rect(startX,startY,100,200);
  stroke(247, 81, 109);
  strokeWeight(8);
  line(startX + 10, startY + 10, startX + 90 , startY + 90);
  line(startX + 10, startY + 50, startX + 90 , startY + 140);
  line(startX + 10, startY + 90, startX + 90 , startY + 180);
}

void crab(){
  fill(250, 77, 22);
  int startX = 200;
  int startY = 300;
  rect(startX,startY,100,200);
  fill(255);
  rect(startX + 90,startY,10,200);
  ellipse(startX + 50, startY + 200, 100, 25);
}

// VEGGIES

void avocado(){
  fill(0, 140, 40);
  int startX = 200;
  int startY = 300;
  arc(startX + 50, startY + 100, 120, 200, PI/2, (3* PI)/2);
  fill(141, 237, 168);
  arc(startX + 50, startY + 96, 100, 180, PI/2, (3* PI)/2);
}

void carrot(){
  
}

void cucumber(){
  fill(0, 140, 40);
  int startX = 200;
  int startY = 300;
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
