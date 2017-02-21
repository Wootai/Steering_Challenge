// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: [coming soon]

class Vehicle{
    PVector pos;
    PVector target;
    PVector vel;
    PVector acc;
    PVector desired;
    float maxspeed;
    float maxforce;
    
  Vehicle (PVector t) {
     pos = new PVector(random(width), random(height));
     target = t;
     vel = PVector.random2D();
     acc = new PVector();
     maxspeed = 10;
     maxforce = 1;
  }

  void behaviors() {
    PVector arrive = arrive(target.x, target.y);
    applyForce(arrive);

  }

  void applyForce(PVector f) { //<>//
    vel.add(f);
}

  void update() {
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
  }

  void show() {  
    stroke(255);
    strokeWeight(8);
    point(pos.x, pos.y);
  }

  PVector arrive(float x, float y) {
    PVector mytar = new PVector(x, y);
    desired = mytar.sub(pos);
    
    float d = desired.mag();
    println(d);
    float speed = maxspeed;
  
    if (d < 100) {
      speed = map(d, 0, 100, 0, maxspeed);
    }
  
    desired.setMag(speed);
    PVector steer = desired.sub(vel);
    steer.limit(maxforce);
    return steer;
  }
}