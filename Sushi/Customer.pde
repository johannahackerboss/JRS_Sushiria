class Customer{

  private String name;
  private String[] names = {"Rona", "Eli", "Wyatt", "Kevin", "Stella", "Rose", "Johanna", "boss Novillo"};
  private int index;
  private color[] shirts = {color(0, 153, 76), color(0, 153, 76), color(204, 0, 0), color(204, 102, 0), color(255, 255, 153), color(255, 0, 127), color(178, 102, 255)};
  private PImage[] faces;
  private boolean boss = false;
  
  public Customer (){
    faces = new PImage[8];
    faces[0] = loadImage("images/rona.png");
    faces[1] = loadImage("images/eli.png");
    faces[2] = loadImage("images/wyatt.png");
    faces[3] = loadImage("images/kevin.png");
    faces[4] = loadImage("images/stella.png");
    faces[5] = loadImage("images/rose.png");
    faces[6] = loadImage("images/johanna.png");
    faces[7] = loadImage("images/novillo.png");
    if (boss){
      index = 7
    } else{
       index = (int)(Math.random() * 7);
    }
    name = names[index];
  }
  
  public String getName(){
    return name;
  }
  public void makeCustomer(float x, float y){
     fill(shirts[index]);
     rect(x - 50, y - 60, 100, 120, 20);
     PImage face = faces[index].copy();
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
  }

}
