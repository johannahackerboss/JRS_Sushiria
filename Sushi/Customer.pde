class Customer{

  private String name;
  private String[] names = {"Rona", "Eli", "Wyatt", "Kevin", "Stella", "Rose", "Johanna"};
  private int index;
  private color[] shirts = {color(0, 153, 76), color(0, 153, 76), color(204, 0, 0), color(204, 102, 0), color(255, 255, 153), color(255, 0, 127), color(178, 102, 255)};
  
  public Customer (){
    index = (int)(Math.random() * 7);
    name = names[index];
  }
  
  public String getName(){
    return name;
  }
  public void makeCustomer(float x, float y){
     fill(shirts[index]);
     rect(x - 40, y - 50, 80, 100, 20);
     circle(x, y - 80, 60);
  }

}
