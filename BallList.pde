class BallList extends ArrayList<Ball> {
   
  private BallList getRolling() {
    BallList temp = new BallList();
    for(Ball ball: this) {
      if (!ball.bouncing && ball.rolling) {
        temp.add(ball);
      }
    }
    return temp;
  }
  
  private BallList getBouncing() {
    BallList temp = new BallList();
    for(Ball ball: this) {
      if (ball.bouncing) {
        temp.add(ball);
      }
    }
    return temp;
  }
  
  private BallList getMoving() {
    BallList temp = new BallList();
    for(Ball ball: this) {
      if (ball.bouncing || ball.rolling) {
        temp.add(ball);
      }
    }
    return temp;
  }
}
