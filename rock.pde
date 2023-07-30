class Rock {
  float x;
  float y;
  float direction;
  float tdirection;
  float speed;
  float tspeed;
  float[][] v = new float[6][2]; //Use this to create a unique shape for the rock in the constructor.
  
  boolean exists;
  
  Rock() {
    switch(int(random(1, 5))) {
        case 1: 
          x = random(0, width);
          y = -50;
          direction = random(PI/6, 5*PI/6);
          break;
        case 2: 
          x = random(0, width);
          y = height + 50;
          direction = random(7*PI/6, 11*PI/6);
          break;
        case 3: 
          x = -50;
          y = random(0, height);
          direction = random(-PI/3, PI/3);
          break;  
        case 4: 
          x = width + 50;
          y = random(0, height);
          direction = random(2*PI/3, 4*PI/3);
          break;
    }
    
    speed = random(.9, 4);
    tspeed = random(-2, 2);
    tdirection = direction;
    
    for(int i = 0; i < 6; i++) {
      v[i][0] = cos(radians(i*60)) * random(20, 40);
      v[i][1] = sin(radians(i*60)) * random(20, 40);
    }
    
    exists = true;
  }
  
  void show() {
    pushMatrix();
    stroke(255);
    strokeWeight(2);
    translate(x, y);
    rotate(tdirection);
    line(v[0][0], v[0][1], v[1][0], v[1][1]);
    line(v[1][0], v[1][1], v[2][0], v[2][1]);
    line(v[2][0], v[2][1], v[3][0], v[3][1]);
    line(v[3][0], v[3][1], v[4][0], v[4][1]);
    line(v[4][0], v[4][1], v[5][0], v[5][1]);
    line(v[5][0], v[5][1], v[0][0], v[0][1]);
    popMatrix();
  }
  
  void move() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
  }
  
  void turn() {
    tdirection += radians(tspeed);
  }
  
  boolean offScreen() {
    if(x < -50 || x > width + 50 || y < -50 || y > height + 50) {
      return true;
    } else { 
      return false;
    }
  }
}