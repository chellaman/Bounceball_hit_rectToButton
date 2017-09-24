float ballX = 1;
float ballY = 1;

float speedX = 4;
float speedY = 4;

float rectX=280;
float rectY=280;
float rectWidth=50;
float rectHeight=50;
float radius = 50;

boolean isClickable = false;
boolean clicked = false;
PImage webImg;

void setup() {
  size(600, 600);
  String url = "http://s2.quickmeme.com/img/f7/f76890df77ddcdcf2a7fd5fe0db1f1219aee84070dac06937412972f7f19d6c0.jpg";
  webImg = loadImage(url, "jpg");
}

void draw() {
  background(2432);
  //button
  noStroke();
  fill(124, 45, 255);
  rect(rectX, rectY, rectWidth, rectHeight);

  //moving ball
  if (ballX > width)
  {
    speedX = speedX * -1;
  }
  if (ballY > height) {
    speedY = speedY * -1;
  } 
  if (ballX < 0)
  {
    speedX = speedX * -1;
  } 
  if (ballY < 0) {
    speedY = speedY * -1;
  }

  //button collision
  if((ballX > rectX) && (ballX < rectX + rectWidth) &&(ballY > rectY) && (ballY < rectY + rectHeight)) {
    speedX = speedX * -1;
      speedY = speedY * -1;
      isClickable = true;
  }
  

  ballX += speedX;
  ballY += speedY;
  //ball
  noStroke();
  fill(255);
  ellipse(ballX, ballY, 10, 10);
  
  //change button color once clickable
  if(isClickable == true){
       fill(40, 211, 214);
       stroke(255);
       strokeWeight(2);
      rect(rectX, rectY, rectWidth, rectHeight);
    }
    
    if(clicked == true){
    image(webImg, rectX-150, rectY-100, 350, 230);
    }
  }

void mousePressed() {
  if (isClickable == true) {
    if((mouseX > rectX) && (mouseX < rectX + rectWidth) &&(mouseY > rectY) && (mouseY < rectY + rectHeight)){
      clicked = true;
      } 
  }
}