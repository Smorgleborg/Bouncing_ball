float x = -20;
float yPeak = 500;
float xReset = -19;
float bounce = 0.5;
float circleX = random(1, 400);
float circleSpeed = 3.17089423;
float ballX = random(1, 400);
float ballSpeed = 4.9127834;
boolean noBallTail = true;

boolean drawBall = true;
boolean drawCircle = true;
boolean drawLine = true;

boolean drawBallLine = true;
boolean drawCircleLine = true;
boolean drawMouseDot = true;

boolean spacing = false;
int spaceDist = 1;
int scaleWeight = 1;

void setup() {
  //size(600, 600);
  size(1380, 700);
}

void draw() {
  if (noBallTail) {
    background(200);
  }
  push();
  fill(0);
  float y = x*x-yPeak;
  translate(0, height);
  if (drawBall) {
    ellipse(ballX, y, 50, 50);
  }
  if (drawCircle) {
    ellipse(circleX, y*15/17, 40, 40);
  }
  if (drawLine) {
    line(ballX, y, circleX, y*15/17);
  }

  x+=bounce;
  pop();

  //background scale
  if(spacing){
    push();
    float spaceScale = 1;
  
    for(int i = 1; i <= spaceDist; i++){
      spaceScale=spaceScale/2;
    };
  
      translate(width/2, 0);
    for (int i = 0; i <= 1/spaceScale; i++) {
      strokeWeight(scaleWeight);
      line(i*spaceScale*width, 0, i*spaceScale*width, height);
      line(-i*spaceScale*width, 0, -i*spaceScale*width, height);
    };
    pop();
  }

  push();
  noStroke();
  fill(200);
  rect(-5, -5, width+10, height/9);
  fill(0);

  triangle(ballX, 40, ballX-20, 0, ballX+20, 0);


  triangle(circleX, 20, circleX-10, 0, circleX+10, 0);

  textAlign(CENTER);
  text("1 toggles the line, 2 toggles the small ball, 3 toggles the big ball, and Space toggles the trail", width/2, height/20);
  text("4 toggles the mouse line to big ball, 5 toggles the line to the small ball, and 6 toggles the mouse ball", width/2, height*3/40);
  pop();


  circleX+=circleSpeed;
  ballX+=ballSpeed;

  if (circleX>width) {
    circleSpeed *= -1;
  } else if (circleX<0) {
    circleSpeed *= -1;
  }

  if (ballX>width) {
    ballSpeed *= -1;
  } else if (ballX<0) {
    ballSpeed *= -1;
  }

  if (x > sqrt(yPeak)) {
    bounce*=-1;
  } else if (x < -sqrt(yPeak)) {
    bounce*=-1;
  }



  if (mousePressed) {
    push();
    translate(0, height);
    fill(0);
    if (drawMouseDot) {
      ellipse(mouseX, mouseY-height, 20, 20);
    }
    if (drawBallLine) {
      line(mouseX, mouseY-height, ballX, y);
    }
    if (drawCircleLine) {
      line(mouseX, mouseY-height, circleX, y*15/17);
    }
    pop();
  }
}

void keyTyped() {
  if (key == 'r') {
    background(200);
  }
  if (key == ' ') {
    if (noBallTail) {
      noBallTail = false;
    } else {
      noBallTail = true;
    }
  }
  if (key == '1' && drawLine) {
    drawLine = false;
  } else if (key == '1') {
    drawLine = true;
  }

  if (key == '2' && drawCircle) {
    drawCircle = false;
  } else if (key == '2') {
    drawCircle = true;
  }

  if (key == '3' && drawBall) {
    drawBall = false;
  } else if (key == '3') {
    drawBall = true;
  }

  if (key == '4' && drawBallLine) {
    drawBallLine = false;
  } else if (key == '4') {
    drawBallLine = true;
  }

  if (key == '5' && drawCircleLine) {
    drawCircleLine = false;
  } else if (key == '5') {
    drawCircleLine = true;
  }

  if (key == '6' && drawMouseDot) {
    drawMouseDot = false;
  } else if (key == '6') {
    drawMouseDot = true;
  } else if (key == '=' && spaceDist <= 10) {
    spaceDist++;
  } else if (key == '-' && spaceDist > 0) {
    spaceDist--;
  } else if (key == '0' && spacing == false) {
    spacing = true;
  } else if (key == '0') {
    spacing = false;
  } else if (key == 'o' && scaleWeight > 0) {
    scaleWeight--;
  } else if (key == 'p') {
    scaleWeight++;
  }
}
