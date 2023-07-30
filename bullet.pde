class Bullet {
  float x;
  float y;
  float direction;
  
  boolean exists;
  
  Bullet(float x, float y, float direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    exists = true;
  }
  
  void move() {
    x += cos(direction) * 7;
    y += sin(direction) * 7;
  }
  
  void show() {
    pushMatrix();
    stroke(0, 255, 0);
    strokeWeight(2);
    translate(x, y);
    line(0, 0, cos(direction) * 7, sin(direction) * 7);
    popMatrix();
  }
  
  boolean offScreen() {
    if(x < -5 || x > width + 5 || y < -5 || y > height + 5) {
      return true;
    } else { 
      return false;
    }
  }
}