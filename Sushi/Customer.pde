class Customer{

  private String name;
  private String[] names = {"Eli", "Wyatt", "Kevin", "Stella", "Rose", "Johanna", "boss Novillo"};
  private int index;
  private color[] shirts = {color(0, 153, 76), color(204, 0, 0), color(204, 102, 0), color(255, 255, 153), color(255, 0, 127), color(178, 102, 255), color(102, 178, 255)};
  private PImage[] faces;
  
  public Customer (){
    faces = new PImage[8];
    faces[0] = loadImage("images/eli.png");
    faces[1] = loadImage("images/wyatt.png");
    faces[2] = loadImage("images/kevin.png");
    faces[3] = loadImage("images/stella.png");
    faces[4] = loadImage("images/rose.png");
    faces[5] = loadImage("images/johanna.png");
    faces[6] = loadImage("images/novillo.png");
    index = (int)(Math.random() * 7);
    name = names[index];
  }
  
  public String getName(){
    return name;
  }
  
public void makeCustomer(float x, float y) {
  // LEGS
  fill(50, 50, 80);
  rect(x - 28, y + 60, 24, 70, 5); 
  rect(x + 4,  y + 60, 24, 70, 5);   
  
  // FEET
  fill(40, 30, 20);
  ellipse(x - 16, y + 132, 34, 16); 
  ellipse(x + 16, y + 132, 34, 16); 
  
  // BODY (shirt)
  fill(shirts[index]);
  rect(x - 45, y - 20, 90, 85, 12); 
  
  // ARMS
  fill(shirts[index]);
  rect(x - 65, y - 15, 22, 60, 8); 
  rect(x + 43, y - 15, 22, 60, 8); 
  
  // HANDS
  fill(235, 195, 160);
  ellipse(x - 54, y + 48, 20, 20); 
  ellipse(x + 54, y + 48, 20, 20); 
  
  // NECK
  fill(235, 195, 160);
  rect(x - 12, y - 30, 24, 20);
  
  // HEAD (circular face)
  PImage face = faces[index].copy();
  face.resize(80, 80);
  PImage mask = createImage(80, 80, RGB);
  mask.loadPixels();
  for (int i = 0; i < mask.pixels.length; i++) {
    int xPos = i % 80;
    int yPos = i / 80;
    float d = dist(xPos, yPos, 40, 40);
    if (d < 40) {
      mask.pixels[i] = color(255);
    } else {
      mask.pixels[i] = color(0);
    }
  }
  mask.updatePixels();
  face.mask(mask);
  imageMode(CENTER);
  image(face, x, y - 60, 80, 80);
  
  noFill();
  stroke(0);
  strokeWeight(2);
  circle(x, y - 60, 80);
  
  rectMode(CORNER);
  imageMode(CORNER);
  noStroke();
}

}
