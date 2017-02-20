// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: [coming soon]

class Vehicle{
    PVector pos;
    PVector target;
    PVector vel;
    PVector acc;
    
    float r;
    float maxspeed;
    float maxforce;
    
  Vehicle (float x, float y) {
     pos = new PVector(random(width), random(height));
     target = new PVector(x, y);
     vel = PVector.random2D();
    
     r = 8;
     maxspeed = 10;
     maxforce = 1;
  }

  void Behaviors() {
  PVector arrive = arrive(target);
  PVector mouse = new PVector(mouseX, mouseY);
  PVector flee = flee(mouse);

  arrive.mult(1);
  flee.mult(5);

  applyForce(arrive);
  applyForce(flee);
}

  PVector applyForce(PVector f) {
  return acc.add(f);
}

  void update() {
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  void show() {
    stroke(255);
    strokeWeight(8);
    point(pos.x, pos.y);
}


  PVector arrive(PVector target) {
    PVector desired = new PVector();
    desired = target.sub(pos);
    float d = desired.mag();
    float speed = maxspeed;
    if (d < 100) {
      speed = map(d, 0, 100, 0, maxspeed);
    }
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }

  PVector flee(PVector target) {
    PVector desired = PVector.sub(target, this.pos);
    float d = desired.mag();
      if (d < 50) {
        desired.setMag(this.maxspeed);
        desired.mult(-1);
        PVector steer = desired.sub(this.vel);
        steer.limit(this.maxforce);
        return steer;
      } else {
        return new PVector(0, 0);
    }
  }
}