import processing.serial.*;

//Left click to random face.


Serial myPort;
int diceSize = 117;
String val;
//int[] inputVars = {0, 0};


void setup() {
  frameRate(10);
  size (500, 500);
  String portName = Serial.list()[7];
  myPort = new Serial(this, portName, 9600);
  //noLoop();
  //println(Serial.list()); 
  //myPort = new Serial(this, Serial.list()[5], 9600);
  //myPort.bufferUntil('\n');
}

void draw() {
  if ( myPort.available() > 0) 
  {  
  val = myPort.readStringUntil('\n');         // read it and store it in val
  val = trim(val);
  } 
  println(val);
  
  background(#43936B);

  //dice
  noStroke();
  fill(#FFF3D6);
  rectMode(CENTER);
  rect(width/2, height/2, diceSize, diceSize, diceSize/5);

  //dots
  fill(50);
  //int side = int(random(1, 7));
  if (val != null){
  int side = int(val);
  if (side == 1 || side == 3 || side == 5)
    ellipse(width/2, height/2, diceSize/5, diceSize/5); 
  if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) { 
    ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 4 || side == 5 || side == 6) {
    ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 6) {
    ellipse(width/2, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }

  //roll
  if (mousePressed && mouseButton == LEFT)
    noLoop();
  if (mousePressed && mouseButton == RIGHT)
    noLoop();
  }
}

void mousePressed() {
  loop();
}
