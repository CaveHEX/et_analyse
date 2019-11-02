class Core {

  PShape sphere;
  int sphereRad;

  Core() {
    sphereRad = floor(height * 0.4);
    this.reset();
  }

  void update() {
    if ( frameCount % 120 == 0 ) {
      core.reset();
    } else if ( frameCount % 120 > 60 ) {
      shuffle(sphere, 4);
    }
  }

  void render(PGraphics pg) {
    pg.push();
    pg.translate(width/2, height/2);
    pg.rotate(t, t*2, t*3, 1);
    render(pg, sphere, 0.3, PI);
    render(pg, sphere, 1.0, 0);
    pg.pop();
  }

  void render(PGraphics pg, PShape shape, float scl, float offset) {
    pg.push();
    pg.scale(scl);
    pg.rotateY(offset);
    pg.shape(shape);
    pg.pop();
  }

  void run(PGraphics pg) {
    this.update();
    this.render(pg);
  }

  void reset() {
    sphere = makeSpiralSphere(15000, sphereRad);
    modulate(sphere);
  }
}
