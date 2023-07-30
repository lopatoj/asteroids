Ship s;
ArrayList<Bullet> b = new ArrayList<Bullet>();
ArrayList<Rock> r = new ArrayList<Rock>();
ArrayList<Explosion> e = new ArrayList<Explosion>();

PFont h;

int score;
int level = 0;
int shoot = 40;

boolean keyr = false;

void setup() {
  fullScreen();
  smooth();
  noFill();
  h = createFont("helvetica", 24);
  textFont(h);
  
  s = new Ship(); 
}

void draw() {
  background(0);
  
  if(score < 1) {
    reset();
  }
  
  fill(255);
  textSize(24);
  text(str(int(frameRate)) + " fps", 20, 40);
  text(str(score) + " asteroids left", 20, 70);
  text("level: " + str(level), 20, 100);
  
  if(s.exists) {
    s.show(shoot);
  }
  s.move();
  s.turn();
  s.input();
  
  shoot();
  
  for (int i = 0; i < e.size(); i++) {
    e.get(i).show();
    e.get(i).move();
    
    if(e.get(i).done()){
      e.remove(i);
    }
  }
  
  for(int i = 0; i < r.size(); i++) {
    if(r.get(i).exists) {
      r.get(i).show();
    }
    r.get(i).move();
    r.get(i).turn();
    
    for (int j = 0; j < b.size(); j++) {
      if(dist(r.get(i).x, r.get(i).y, b.get(j).x, b.get(j).y) < 30 && r.get(i).exists && b.get(j).exists) {
        e.add(new Explosion(r.get(i).x, r.get(i).y, r.get(i).direction, r.get(i).speed));
        r.get(i).exists = false;
        b.get(j).exists = false;
        score--;
      }
    }
    
    if(dist(r.get(i).x, r.get(i).y, s.x, s.y) < 30 && r.get(i).exists && s.exists) {
      textAlign(CENTER); 
      fill(255);
      textSize(50);
      text("game over", width/2, height/2);
      level = 0;
      textSize(24);
      noLoop();
    }
    
    if(r.get(i).offScreen()) {
      if(r.get(i).exists) {
        r.add(new Rock());
      }
      r.remove(i);
    }
  }
  
  for(int i = 0; i < b.size(); i++) {
    if(b.get(i).exists) {
      b.get(i).show();
    }
    b.get(i).move();
    
    if(b.get(i).offScreen()) {
      b.remove(i);
    }
  }
}

void shoot() {
  if(s.space && shoot > 9) {
    s.space = false;
    b.add(new Bullet(s.x + cos(s.direction) * 16, s.y + sin(s.direction) * 16, s.direction));
    shoot = 0;
  }
  
  if(shoot < 10) {
    shoot++;
  }
}

void reset() {
  level++;
  for (int i = 0; i < level * 20; i++) {
    r.add(new Rock());
  }
  score = level * 20;
  keyr = false;
}

//Input Processing:
void keyPressed() {
  if(keyCode == UP) {
    s.up = true;
  } else if(keyCode == LEFT) {
    s.left = true;
  } else if(keyCode == RIGHT) {
    s.right = true;
  } else if(keyCode == DOWN) {
    s.down = true;
  } else if(key == ' ') {
    s.space = true;
  } else if(key == 'r') {
    keyr = true;
    level = 0;
    r.clear();
    reset();
  }
}

void keyReleased() {
  if(keyCode == UP) {
    s.up = false;
  } else if(keyCode == LEFT) {
    s.left = false;
  } else if(keyCode == RIGHT) {
    s.right = false;
  } else if(keyCode == DOWN) {
    s.down = false;
  } else  if(key == ' ') {
    s.space = false;
  } else if(key == 'r') {
    keyr = false;
  }
}