BallList balls = new BallList();
int ballRadius = 20;
int ground;

void setup() {
  fullScreen();
  frameRate(80);
  stroke(255);
  strokeWeight(ballRadius * 2);
  ground = height - ballRadius;
}

void draw() {
  background(20);
  checkVerticalCollision();
  checkHorizontalCollision();
  applyGravity();
  applyFriction();
  updatePositions();
  drawBalls();
}

void generateBall() {
  balls.add(new Ball(ballRadius, mouseX, mouseY, random(60) - 30, -random(30)));
}

void applyGravity() {
  for (Ball ball: balls.getBouncing()) {
    ball.applyGravity();
  }
}

void applyFriction() {
  for (Ball ball: balls.getRolling() ) {
    ball.applyFriction(); 
  }
}

void checkVerticalCollision() {
  for (Ball ball : balls) {
    if (ball.positionY >= height - ballRadius) {
      ball.bounceVertical();
    }
  }
}

void checkHorizontalCollision() {
  for (Ball ball : balls) {
    if (ball.positionX >= width - ballRadius || ball.positionX <= ballRadius) {
      ball.bounceHorizontal();
    }
  }
}

void updatePositions() {
  for (Ball ball : balls.getMoving()) {
    ball.updatePosition();
  }
}

void drawBalls() {
  for (Ball ball: balls) {
    ball.place();
  }
}

void mouseClicked() {
  generateBall();
}
