class Customer{

  private String name;
  private String[] names = {"Eli", "Wyatt", "Kevin", "Stella", "Rose", "Johanna", "boss Novillo"};
  private int index;
  private color[] shirts = {color(0, 153, 76), color(204, 0, 0), color(204, 102, 0), color(255, 255, 153), color(255, 0, 127), color(178, 102, 255), color(102, 178, 255)};
  private PImage[] faces;
  private boolean boss = true;
  
  public Customer (){
    faces = new PImage[8];
    faces[0] = loadImage("images/eli.png");
    faces[1] = loadImage("images/wyatt.png");
    faces[2] = loadImage("images/kevin.png");
    faces[3] = loadImage("images/stella.png");
    faces[4] = loadImage("images/rose.png");
    faces[5] = loadImage("images/johanna.png");
    faces[6] = loadImage("images/novillo.png");
    if (boss){
      index = 6;
    }
    else{
       index = (int)(Math.random() * 6);
    }
    name = names[index];
  }
  
  public String getName(){
    return name;
  }
  public void makeCustomer(float x, float y){
     fill(shirts[6]);
     rect(x - 50, y - 60, 100, 120, 20);
     PImage face = faces[6].copy();
     face.resize(75, 75);
     PImage mask = createImage(75, 75, RGB);
     mask.loadPixels();
     for (int i = 0; i < mask.pixels.length; i++) {  
      int xPos = i % 75;
      int yPos = i / 75;
      float d = dist(xPos, yPos, 37.5, 37.5);
       if (d < 37.5) {
         mask.pixels[i] = color(255);
       } else {
         mask.pixels[i] = color(0);
       }
     }
     mask.updatePixels();
     face.mask(mask);
     imageMode(CENTER);
     image(face, x, y - 95, 75, 75); 
     noFill();
     stroke(0);
     strokeWeight(2);
     circle(x, y - 95, 75); 
     fill(255);
     stroke(0);
     rectMode(CENTER);
     rect(x, y - 25, 90, 25, 5);
     fill(0);
     textAlign(CENTER, CENTER);
     textSize(14);
     text(name, x, y - 25);
  }

}
