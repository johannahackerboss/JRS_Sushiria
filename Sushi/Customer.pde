class Customer{

  private String name;
  private String[] names = {"Rona", "Eli", "Wyatt", "Kevin", "Stella", "Rose", "Johanna"};
  private int index;
  
  public Customer (){
    index = (int)(Math.random() * 7);
    name = names[index];
  }
  
  public String getName(){
    return name;
  }
  public void makeCustomer(float x, float y){
     rect(x - 10, y - 10, 20, 30, 20);
     circle(x, y - 5, 5);
  }

}
