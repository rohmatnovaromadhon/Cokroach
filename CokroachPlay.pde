ArrayList<Cokroach> coks;
import processing.sound.*;

PImage img;
SoundFile sfx1;
SoundFile sfx2;
int lastTime = 0; 
int score = 0;  
String name = "Rohmat Nova Romadhon";  
String nim = "22.11.5360";    

void setup() {
  size(800, 800);
  coks = new ArrayList<Cokroach>();
  img = loadImage("kecoa.png");
  
  // Memuat efek suara
  sfx1 = new SoundFile(this, "hit1.wav");
  sfx2 = new SoundFile(this, "hit2.wav");
}

void draw() {
  background(255);
  
  textAlign(CENTER, TOP);
  textSize(18);
  fill(0);
  text(name + " - " + nim, width / 2, 20);
  
  if (millis() - lastTime >= 5000) {
    coks.add(new Cokroach(img, random(width), random(height)));
    lastTime = millis();
    sfx2.play(); 
  }
  
  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach c = coks.get(i);
    c.live();
  }
  
  fill(51);
  textSize(16);
  text("Jumlah kecoak: " + coks.size(), 70, 750); 
  text("Skor: " + score, 70, 720);
}

void mouseClicked() {
  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach c = coks.get(i);
    
    float d = dist(mouseX, mouseY, c.pos.x, c.pos.y);
    
    if (d < 30) {
      coks.remove(i);
      
      if (random(1) < 0.5) {
        sfx1.play();
      } else {
        sfx2.play();
      }
      break;
    }
  }
}
