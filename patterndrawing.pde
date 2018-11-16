// import processing.sound.*;

int hVal = 0;
int sVal = 100;
int bVal = 100;
int option =1;
int numOfMirror=2;
float angle = 360 , sectionAngle;
boolean wordsCol = true, BGCol = false, eraserMode = false;
int num = 0; 
float easing;


// SoundFile file;

Painter newpaint;

color cWord = color(0);
color cBG = color(255);

PGraphics canvas;
/*PGraphics markDoubleMirror;
PGraphics markRotation;
PGraphics markTwoMKal;
PGraphics markThreeMKal;
PGraphics markTiles;*/

float s = 5.5; //pen size

color brushColor;

void setup(){
  fullScreen();
  noStroke();
  colorMode(HSB,360,100,100);
  newpaint = new Painter();
  canvas = createGraphics(width,height);
  brushColor = color(hVal,sVal,bVal);
  // file = new SoundFile(this, "bgm.mp3");
  // file.loop();
}

void draw(){
  colorMode(HSB,360,100,100);
  background(cBG);
  fill(255);
  dispBackgroundColorValues();
  printType();
  fill(brushColor);
  
  switch(option){
    case 1:
      sectionAngle = angle/numOfMirror;
      newpaint.paintRotation();
      if (mousePressed) {
        canvas.beginDraw();
        canvas.fill(brushColor); //<>//
        canvas.noStroke();
        canvas.pushMatrix();
        canvas.translate(width/2, height/2);
        for (int i=1; i<=numOfMirror; i++){
        canvas.ellipse(newpaint.x - (width/2), newpaint.y - (height/2), s, s);
        canvas.rotate(radians(sectionAngle));
        }
        canvas.popMatrix();
        canvas.endDraw();
      }
      image(canvas,0,0);
      break;
    case 2:
      if(numOfMirror%2 !=0 && numOfMirror != 1) 
        numOfMirror-=1;
      else if (numOfMirror == 1)
        numOfMirror+=1;
      sectionAngle = angle/(numOfMirror/2);
      newpaint.paintTMKale();
      if (mousePressed) {
        canvas.beginDraw();
        canvas.fill(brushColor);
        canvas.noStroke();
        canvas.pushMatrix();
        canvas.translate(width/2, height/2);
        for (int i=1; i<=(numOfMirror/2); i++){
        canvas.ellipse(newpaint.x - (width/2), newpaint.y - (height/2), s, s);
        canvas.ellipse(-(newpaint.x - (width/2)), newpaint.y - (height/2), s, s);
        canvas.rotate(radians(sectionAngle));
        }
        canvas.popMatrix();
        canvas.endDraw();
      }
      image(canvas,0,0);
      break;
  }
  
}

void dispBackgroundColorValues(){
  textSize(30);
  fill(cWord);
  text(nf(hVal,3,0),55,height-90);
  textSize(12);
  text("Press Q -",0, height-95);
  text("+ Press W",115, height-95);
  textSize(30);
  fill(cWord);
  text(nf(sVal,3,0),55,height-60);
  textSize(12);
  text("Press A -",0, height-65);
  text("+ Press S",115, height-65);
  textSize(30);
  fill(cWord);
  text(nf(bVal,3,0),55,height-30);
  textSize(12);
  text("Press Z -",0, height-35);
  text("+ Press X",115, height-35);
  textSize(20);
  fill(cWord);
  text("Sections # "+nf(numOfMirror),width-130,height/2);
  textSize(12);
  text("up arrow +",(width-100), (height/2)-25);
  text("down arrow -",(width-105), (height/2)+20);
  textSize(20);
  fill(cWord);
  text("Pen Size: "+nf(s),width-125,height-40);
  textSize(12);
  text("Press < +",(width-100), height-60);
  text("Press > -",(width-100), height-25);
  textSize(16);
  
  textSize(20);
  fill(cWord);
  text("Speed: "+ nf(easing,0,3) ,width-128,height-120);
  textSize(12);
  text("Press [ +",(width-100), height-140);
  text("Press ] -",(width-100), height-100);
  
  fill(255);
  
  
}

void printType(){
  fill(cWord);
  textSize(36);
  switch(option){
    case 1:
    text("Rotation",0,31);
    triangle(160,25,155,20,155,30);
    rect(150,23,5,4);
    break;
    case 2:
    triangle(10,25,15,20,15,30);
    rect(15,23,5,4);
    text("Two Mirror Kaleidoscope",20,30);
    break;
    
  }
  textSize(20);
  text("Use left/right arrows to switch layout",width-365,20);
  text("Press B to change background color (Black/White)",width-485,40);
  text("Press V to on/off instructions",width-287,60);
  text("Press P to save current screen",width-290,80);
  text("Press C to clear all",(width-152),120);
  text("Press E for eraser",(width-170),100);
  fill(255);
}


void keyPressed(){
  if(keyCode == RIGHT){
    if(option<2){
      option+=1;
    }
  }
  if(keyCode == LEFT){
    if(option>1){
      option-=1;
    }
  }
  if(keyCode == UP){
    if(numOfMirror<36)
      if(option == 2)
        numOfMirror+=2;
      else 
        numOfMirror+=1;
  }
  if(keyCode == DOWN){
    if(numOfMirror>1)
      if(option == 2 && numOfMirror>2)
        numOfMirror-=2;
      else 
        numOfMirror-=1;
  }
  if(key == 'q'){
    if(hVal == 0)
      hVal = 355;
    else
      hVal-=5;    
  }
  if(key == 'w'){
    if(hVal == 355)
      hVal = 0;
    else
      hVal+=5; 
  }
  if(key == 'a' && sVal>0){
    sVal-=5;
  }
  if(key == 's' && sVal<100){
    sVal+=5;
  }
  if(key == 'z' && bVal>0){
    bVal-=5;
  }
  if(key == 'x' && bVal<100){
    bVal+=5;
  }
  if(key=='c'){
    canvas.beginDraw(); 
    canvas.clear();
    canvas.endDraw();
  }
  if(key==','){
    if(s>1.5)
      s-=1;
  }
  if(key=='.'){
    if(s<9.5)
      s+=1;
  }
  if(key=='v'){
    if (wordsCol){
      cWord = color(0,0,100);
      wordsCol = false;
    }else{
      cWord = color(0,0,0);
      wordsCol = true;
    }
  }
  if(key=='b'){
    if (BGCol){
      cBG = color(0,0,100);
      BGCol = false;
    }else{
      cBG = color(0,0,0);
      BGCol = true;
    }
  }
  if(key == 'e'){ //<>//
    if (eraserMode){
      brushColor = color(hVal,sVal,bVal);
      eraserMode = false;
    }else{
      brushColor = cBG;
      eraserMode = true;
    }
  }
  if(key=='[' && easing <0.02){
    easing+=0.002;
  }
    if(key==']' && easing >0.002){
    easing-=0.002;
  }
  if(key == 'p'){ 
    int d = day();    
    int m = month();  
    int y = year();
    int sec = second();  
    int min = minute();  
    int hr = hour();    
    String s = nf(y)+nf(m,2,0)+nf(d,2,0)+nf(hr,2,0)+nf(min,2,0)+nf(sec,2,0)+".png";
    save(s);
    num++;
  }
  
}
  


//classes


class Painter {
  float x, y;


  Painter() {
    x = 0;
    y = 0;
    
    easing = 0.02;
  }

  void paintRotation() {
    float targetX = mouseX;
    x = x + (targetX - x) * easing;
    float targetY = mouseY;
    y = y + (targetY - y) * easing;
    
    sectionAngle = angle/numOfMirror;
    pushMatrix();
    translate(width/2, height/2);
    for (int i =1; i<=numOfMirror; i++){
    ellipse(x - (width/2), y - (height/2), s, s);
    rotate(radians(sectionAngle));
    }
    popMatrix();
  }
  
  void paintTMKale() {
    float targetX = mouseX;
    x = x + (targetX - x) * easing;
    float targetY = mouseY;
    y = y + (targetY - y) * easing;
    sectionAngle = angle/(numOfMirror/2);
    
    pushMatrix();
    translate(width/2, height/2);
    for (int i =1; i<=(numOfMirror/2); i++){
    ellipse(x - (width/2), y - (height/2), s, s);
    ellipse(-(x - (width/2)), y - (height/2), s, s);
    rotate(radians(sectionAngle)); 
    }
    popMatrix();
  }
}