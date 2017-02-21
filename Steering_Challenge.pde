// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: [coming soon]

PFont f;

Vehicle v;
PVector p;

ArrayList<Vehicle> vehicles;
ArrayList<PVector> points;

void setup() {
  
  f = createFont("AvenirNextLTPro-Demi.otf", 192);

  vehicles = new ArrayList<Vehicle>();
  points = new ArrayList<PVector>();

  size(600, 300);
  background(51);
  textFont(f);
  textSize(192);
  fill(255);
  noStroke();


  p = new PVector(random(width), random(height));

  v = new Vehicle(p);
  vehicles.add(v);

  }

void draw() {
 background(51);
 
 for (int i = 0; i < vehicles.size(); i++) {
    vehicles.get(i).behaviors();
    vehicles.get(i).update();
    vehicles.get(i).show();
  }
}