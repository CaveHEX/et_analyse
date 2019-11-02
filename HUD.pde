class HUD {

  HudBars hubBars;

  HUD() {
    hubBars = new HudBars();
  }
  void update() {
    hubBars.update();
  }

  void render() {
    push();
    translate(0, 0, 1);
    hubBars.render();
    renderLoading();
    renderFrame();
    pop();
  }

  void run() {
    this.update();
    this.render();
  }

  void renderLoading() {
    push();
    noFill();
    stroke(220, 255, 255);
    strokeWeight(2.0);
    float a = t * 3;
    arc(width * 0.9, height * 0.9, 50, 50, a, a + PI + sin(t) * HALF_PI);
    pop();
  }

  void renderFrame() {
    float ex = 0.05;

    stroke(255);
    strokeWeight(1);
    line(width*ex, 0, width*ex, height);
    line(width - width*ex, 0, width - width*ex, height);
  }
}
