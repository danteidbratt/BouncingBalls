class Ball {

  int diameter;
  int maxSpeed = 200;
  int maxdiameter = 300;
  float positionX;
  float positionY;
  float speedX;
  float speedY;
  boolean rolling;
  boolean bouncing;
  int red;
  int green;
  int blue;
  ;  
  float weight = 1;
  float friction = 0.12;
  float bounce = 1.6;
  float groundY;
  float rightWallX;
  float leftWallX;

  Ball(float positionX, float positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
    this.rolling = true;
    this.bouncing = true;
    this.red = randomColor();
    this.green = randomColor();
    this.blue = randomColor();
    this.diameter = 10;
    this.setBoundaries();
  }

  private int randomColor() {
    return (int) random(255);
  }

  void applyGravity() {
    if (speedY < maxSpeed) {
      speedY += weight;
    }
  }

  void applyFriction() {
    if (Math.abs(speedX) < 1) {
      rolling = false;
    } else if (speedX > 0) {
      speedX -= friction;
    } else if (speedX < 0) {
      speedX += friction;
    }
  }

  void bounceVertical() {
    if (positionY >= groundY) {
      applyFriction();
      positionY = groundY;
      if (speedY < 5) {
        bouncing = false;
        speedY = 0;
      } else {
        speedY -= bounce * speedY;
      }
    }
  }

  void bounceHorizontal() {
    if (positionX <= leftWallX) {
      positionX = leftWallX;
      mirrorX();
    } else if (positionX >= rightWallX) {
      positionX = rightWallX;
      mirrorX();
    }
  }
  
  private void mirrorX() {
    speedX -= bounce * speedX;
  }

  void updatePosition() {
    positionX += speedX;
    positionY += speedY;
  }

  void hold() {
    this.grow();
    this.drag();
    this.paint();
  }

  void paint() {
    stroke(red, green, blue);
    strokeWeight(diameter);
    point(positionX, positionY);
  }

  void grow() {
    if (diameter < maxdiameter) {
      this.diameter++;
      this.setBoundaries();
    }
  }

  void drag() {
    this.positionX = mouseX;
    this.positionY = mouseY;
  }

  void setBoundaries() {
    this.groundY = height - diameter / 2;
    this.leftWallX = diameter / 2;
    this.rightWallX = width - diameter / 2;
  }
}
