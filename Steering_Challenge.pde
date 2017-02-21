// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: [coming soon]

PFont f;

Vehicle v;
Vehicle p;

ArrayList<Vehicle> vehicles;
ArrayList<Vehicle> targets;

void setup() {
  
  f = createFont("AvenirNextLTPro-Demi.otf", 192);

  vehicles = new ArrayList<Vehicle>();
  targets = new ArrayList<Vehicle>();

  size(600, 300);
  background(51);
  textFont(f);
  textSize(192);
  fill(255);
  noStroke();

  for(int i = 0; i<10; i++){
    PVector ppos = new PVector(random(width), random(height));
    p = new Vehicle(ppos);
    targets.add(p);
  }
  for(int i = 0; i<targets.size(); i++){
      v = new Vehicle(targets.get(i).pos);
    vehicles.add(v);
    }
  }

void draw() {
 background(51);
 
 for (int i = 0; i < vehicles.size(); i++){
    targets.get(i).behaviors();
    vehicles.get(i).run();
    targets.get(i).update();
    vehicles.get(i).update();
    targets.get(i).show();
    vehicles.get(i).show();
  }
}