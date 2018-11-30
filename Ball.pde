class Ball {

  int radius;
  int maxSpeed = 100;
  float positionX;
  float positionY;
  float speedX;
  float speedY;
  boolean rolling;
  boolean bouncing;
  int red;
  int green;
  int blue;;  
  float weight = 1;
  float friction = 0.1;
  float bounce = 1.9;

  Ball(
    int radius, 
    float positionX, 
    float positionY, 
    float speedX, 
    float speedY
    ) {
    this.radius = radius;
    this.positionX = positionX;
    this.positionY = positionY;
    this.speedX = speedX;
    this.speedY = speedY;
    this.rolling = true;
    this.bouncing = true;
    this.red = randomColor();
    this.green = randomColor();
    this.blue = randomColor();
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
    applyFriction();
    positionY = height - radius;
    if (speedY < 2) {
      bouncing = false;
    } else {
      speedY -= bounce * speedY;
    }
  }

  void bounceHorizontal() {
    if (positionX <= 0) {
      positionX = 1;
    } else if (positionX >= width) {
      positionX = width - 1;
    }
    speedX -= 2 * speedX;
  }

  void updatePosition() {
    positionX += speedX;
    positionY += speedY;
  }
  
  void place() {
    stroke(red, green, blue);
    point(positionX, positionY);
  }
}
