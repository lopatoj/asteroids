class Ship {
  float x;
  float y;
  float px;
  float py;
  float direction;
  float fspeed;
  float bspeed;
  float lspeed;
  float rspeed;
  float fireDist;
  
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  boolean space;
  
  boolean exists;
  
  Ship() {
    x = width/2;
    y = height/2;
    direction = 3*PI/2;
    exists = true;
  }
  
  void show(int a) {
    pushMatrix();
    beginShape();
    stroke(255);
    strokeWeight(2);
    translate(x, y);
    rotate(direction);
    fill(0, map(a, 0, 10, 0, 255), 0);
    vertex(-12, 0);
    vertex(-16, -12);
    vertex(16, 0);
    vertex(-16, 12);
    endShape(CLOSE);
    if(moving()) {
      fire();
    }
    popMatrix();
  }
  
  void move() {
    px = x;
    py = y;
    if(x + cos(direction) > 0 && cos(direction) < 0 || cos(direction) > 0 && x + cos(direction) < width) {
      x += cos(direction) * fspeed;
    }
    if(y + sin(direction) > 0 && sin(direction) < 0 || sin(direction) > 0 && y + sin(direction) < height) {
      y += sin(direction) * fspeed;
    }
    if(x - cos(direction) > 0 && cos(direction) > 0 || cos(direction) < 0 && x - cos(direction) < width) {
      x -= cos(direction) * bspeed;
    }
    if(y - sin(direction) > 0 && sin(direction) > 0 || sin(direction) < 0 && y - sin(direction) < height) {
      y -= sin(direction) * bspeed;
    }
  }
  
  boolean moving() {
    if(px != x || py != y) {
      return true;
    } else {
      return false;
    }
  }
  
  void fire() {
    fireDist = map(fspeed, 0, 5, .7, 1.6);
    stroke(255, 150, 50);
    line(-15, random(-2, 2) * fireDist, random(-30, -15) * fireDist, random(-5, 5) * fireDist);
    line(-15, random(-2, 2) * fireDist, random(-30, -15) * fireDist, random(-4, 4) * fireDist);
    line(-15, random(-2, 2) * fireDist, random(-30, -15) * fireDist, random(-4, 4) * fireDist);
    line(-15, random(-2, 2) * fireDist, random(-30, -15) * fireDist, random(-4, 4) * fireDist);
  }
  
  void turn() {
    direction += radians(rspeed - lspeed);
  }
  
  void input() {
    if(up && fspeed < 5) {
      fspeed += .3;
    }
    
    if(down && bspeed < 5) {
      bspeed += .3;
    }

    if(right && rspeed < 5) {
      rspeed += .2;
    }

    if(left && lspeed < 5) {
      lspeed += .2;
    }

    if(fspeed > 0) {
      fspeed -= .1;
    } else {
      fspeed = 0;
    }
    
    if(bspeed > 0) {
      bspeed -= .1;
    } else {
      bspeed = 0;
    }
    
    if(!right) {
      if(rspeed > 0) {
        rspeed -= .15;
      } else {
        rspeed = 0;
      }
    }
    
    if(!left) {
      if(lspeed > 0) {
        lspeed -= .15;
      } else {
        lspeed = 0;
      }
    }
  }
}