BallList balls = new BallList();
int nextBallradius;
Ball nextBall;
int ballRadius = 20;
int aimX;
int aimY;

void setup() {
  fullScreen();
  frameRate(80);
  stroke(255);
  strokeWeight(ballRadius * 2);
}

void draw() {
  background(20);
  if (mousePressed) {
    drawAim();
    nextBall.hold();
  }
  checkVerticalCollision();
  checkHorizontalCollision();
  applyGravity();
  applyFriction();
  updatePositions();
  drawBalls();
}

void applyGravity() {
  for (Ball ball : balls.getBouncing()) {
    ball.applyGravity();
  }
}

void applyFriction() {
  for (Ball ball : balls.getRolling() ) {
    ball.applyFriction();
  }
}

void checkVerticalCollision() {
  for (Ball ball : balls.getBouncing()) {
    ball.bounceVertical();
  }
}

void checkHorizontalCollision() {
  for (Ball ball : balls.getMoving()) {
    ball.bounceHorizontal();
  }
}

void updatePositions() {
  for (Ball ball : balls.getMoving()) {
    ball.updatePosition();
  }
}

void drawBalls() {
  for (Ball ball : balls) {
    ball.paint();
  }
}

void drawAim() {
  strokeWeight(2);
  stroke(200);
  line(mouseX, mouseY, aimX, aimY);
}

void mousePressed() {
  aimY = mouseY;
  aimX = mouseX;
  nextBall = new Ball(mouseX, mouseY);
}

void mouseReleased() {
  nextBall.speedY = (aimY - mouseY) / 5;
  nextBall.speedX = (aimX - mouseX) / 5;
  balls.add(nextBall);
}
