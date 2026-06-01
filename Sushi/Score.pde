int score;
int timeScore;
int placementScore;
int correctnessScore;
int fishScore;
int veggieScore;
int riceScore;
int swX1 = 200, swX2 = 800;
int swY1 = 300, swY2 = 500;
int swWidth = 600;

void drawScoreScreen() {
  background(2, 201, 224);
   drawSides();

  fill(0, 90, 20);
  noStroke();
  rect(240, 0, 600, 80);
  textFont(font);
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(255);
  text("Your Sushi Score!", 540, 40);

  fill(50, 200, 80);
  stroke(30, 140, 50);
  strokeWeight(5);
  circle(370, 260, 200);
  noStroke();
  fill(255);
  textSize(72);
  text(score, 370, 248);
  textSize(15);
  text("out of 100", 370, 300);

  // Stars
  int stars = 0;
  if      (score >= 90) stars = 5;
  else if (score >= 75) stars = 4;
  else if (score >= 60) stars = 3;
  else if (score >= 40) stars = 2;
  else if (score >   0) stars = 1;

  textSize(28);
  String starDisplay = "";
  for (int i = 0; i < 5; i++) {
    starDisplay += (i < stars) ? "★" : "☆";
  }
  fill(255, 180, 0);
  text(starDisplay, 370, 360);

  textSize(14);
  fill(40, 20, 10);
  String msg = "";
  if      (stars == 5) msg = "Perfect roll!";
  else if (stars == 4) msg = "Almost perfect!";
  else if (stars == 3) msg = "Not bad, keep rolling!";
  else if (stars == 2) msg = "The customer is underwhelmed.";
  else                 msg = "Stick to California rolls.";
  fill(255);
  text(msg, 370, 400);

  drawScoreBox("Correctness", correctnessScore, 490, 95);
  drawScoreBox("Time",        timeScore,        490, 175);
  drawScoreBox("Fish",        fishScore,        490, 255);
  drawScoreBox("Veggie",      veggieScore,      490, 335);
  drawScoreBox("Rice",        riceScore,        490, 415);

  fill(73, 200, 80);
  stroke(30, 140, 50);
  strokeWeight(2);
  rect(330, 560, 180, 55, 10);
  fill(255);
  noStroke();
  textSize(18);
  text("New Round", 420, 588);

  fill(220, 50, 50);
  stroke(140, 20, 20);
  strokeWeight(2);
  rect(570, 560, 180, 55, 10);
  fill(255);
  noStroke();
  textSize(18);
  text("Exit Game", 660, 588);

  rectMode(CORNER);
  imageMode(CORNER);
  noStroke();
}

void drawScoreBox(String label, int val, int x, int y) {
  int boxW = 310;
  int boxH = 60;

  fill(255, 255, 255, 200);
  stroke(200);
  strokeWeight(1);
  rect(x, y, boxW, boxH, 8);

  color barColor;
  if      (val >= 70) barColor = color(50, 200, 80);
  else if (val >= 40) barColor = color(255, 180, 0);
  else                barColor = color(220, 50, 50);

  fill(barColor);
  noStroke();
  int barW = (int)((val / 100.0) * (boxW - 16));
  rect(x + 8, y + 36, barW, 16, 4);

  textFont(font);
  textAlign(LEFT, CENTER);
  textSize(14);
  fill(40);
  text(label, x + 12, y + 20);
  textAlign(RIGHT, CENTER);
  text(val + "/100", x + boxW - 12, y + 20);

  textAlign(CENTER, CENTER);
  noStroke();
}

void setTimeScore() {
  int seconds = (millis() - startMillis) / 1000;
  if (seconds <= 30) timeScore = 100;
  else timeScore = max(0, 130 - seconds);
}

void setCorrectnessScore() {
  correctnessScore = 100;
  String correctFish   = fishList[Fish];
  String correctVeggie = veggieList[Veggie];
  for (int i = 0; i < count; i++) {
    String ing = ingredients[i];
    boolean isFish   = ing.equals("salmon") || ing.equals("tuna") || ing.equals("crab");
    boolean isVeggie = ing.equals("avocado") || ing.equals("cucumber") || ing.equals("carrot");
    if (isFish   && !ing.equals(correctFish))   correctnessScore -= 10;
    if (isVeggie && !ing.equals(correctVeggie)) correctnessScore -= 10;
  }
  correctnessScore = max(0, correctnessScore);
}

void setFishScore() {
  fishScore = 0;
  int sections = 5;
  int sectionWidth = swWidth / sections;  // 120px each
  int[] covered = new int[sections];      // best score per section

  for (int i = 0; i < count; i++) {
    String ing = ingredients[i];
    boolean isFish = ing.equals("salmon") || ing.equals("tuna") || ing.equals("crab");
    boolean onSeaweed = (xPositions[i] >= swX1 && xPositions[i] <= swX2 &&
                         yPositions[i] >= swY1 && yPositions[i] <= swY2);

    if (isFish && onSeaweed) {
      // score this piece against every section, keep best per section
      for (int s = 0; s < sections; s++) {
        int targetX = swX1 + s * sectionWidth;
        float d = dist(xPositions[i], yPositions[i], targetX, swY1);
        int sectionScore = max(100 - (int)((d / sectionWidth) * 100), 0);
        if (sectionScore > covered[s]) covered[s] = sectionScore;
      }
    }
  }

  for (int i = 0; i < sections; i++) fishScore += covered[i];
  fishScore /= sections;
}

void setVeggieScore() {
  veggieScore = 0;
  int sections = 10;
  int sectionWidth = swWidth / sections;  // 60px each
  int[] covered = new int[sections];      // best score per section

  for (int i = 0; i < count; i++) {
    String ing = ingredients[i];
    boolean isVeggie = ing.equals("avocado") || ing.equals("cucumber") || ing.equals("carrot");
    boolean onSeaweed = (xPositions[i] >= swX1 && xPositions[i] <= swX2 &&
                         yPositions[i] >= swY1 && yPositions[i] <= swY2);

    if (isVeggie && onSeaweed) {
      // score this piece against every section, keep best per section
      for (int s = 0; s < sections; s++) {
        int targetX = swX1 + s * sectionWidth;
        float d = dist(xPositions[i], yPositions[i], targetX, swY1);
        int sectionScore = max(100 - (int)((d / sectionWidth) * 100), 0);
        if (sectionScore > covered[s]) covered[s] = sectionScore;
      }
    }
  }

  for (int i = 0; i < sections; i++) veggieScore += covered[i];
  veggieScore /= sections;
}

void setRiceScore() {
  riceScore = 100;
  int cols = 10, rows = 5;
  int cellW = swWidth / cols;
  int cellH = (swY2 - swY1) / rows;
  int radius = 35;
  boolean[] covered = new boolean[cols * rows];

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      int cellCX = swX1 + c * cellW + cellW / 2;
      int cellCY = swY1 + r * cellH + cellH / 2;
      for (int i = 0; i < riceCount; i++) {
        if (dist(riceX[i], riceY[i], cellCX, cellCY) < radius) {
          covered[r * cols + c] = true;
          break;
        }
      }
    }
  }

  for (int i = 0; i < cols * rows; i++) {
    if (!covered[i]) riceScore -= 2;
  }
  riceScore = max(0, riceScore);
}

void setPlacementScore() {
  setFishScore();
  setVeggieScore();
  setRiceScore();
  placementScore = (fishScore + veggieScore + riceScore) / 3;
}

void setScore() {
  setCorrectnessScore();
  setPlacementScore();
  setTimeScore();
  score = (correctnessScore + placementScore + timeScore) / 3;
  if (placementScore == 0){
    correctnessScore = 0;
    timeScore = 0;
    score = 0;
  }
}

int getScore() { return score; }
