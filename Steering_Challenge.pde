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
  
  for(int i = 0; i <1; i++){
    //p = new PVector();
    p = new PVector(random(width), random(height));
    points.add(p);
  }

  for (int i = 0; i < points.size(); i++) {
    v = new Vehicle(points.get(i));
    vehicles.add(v);

  }
}


void draw() {
 background(51);
 
 text("train", 100, 200);

 for (int i = 0; i < vehicles.size(); i++) {
    vehicles.get(i).behaviors();
    vehicles.get(i).update();
    vehicles.get(i).show();
  }
}