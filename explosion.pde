class Explosion {
  float x;
  float y;
  float direction;
  float speed;
  float radius;
  
  Explosion(float x, float y, float direction, float speed) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.speed = speed;
    radius = 4;
  }
  
  void show() {
    pushMatrix();
    strokeWeight(2);
    translate(x, y);
    for (int i = 0; i < 360; i += 60) {
      float r = random(-10, 15);
      switch (int(random(1,3))) {
          case 1: 
            stroke(255);; 
            break;
          case 2: 
            stroke(0, 255, 0);; 
            break;
      }
      rotate(radians(i + random(-10, 10)));
      line(0, radius + r, 0, radius + 7 + r);
    }
    popMatrix();
    radius += 2;
  }
  
  void move() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
    
    if(speed > 0) {
      speed -= .05;
    } else {
      speed = 0;
    }
  }
  
  boolean done() {
    if(radius > 40) {
      return true;
    } else {
      return false;
    }
  }
}