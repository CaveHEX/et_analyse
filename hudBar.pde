class HudBar {

  PVector pos;
  PVector dim;
  PVector dimTar;

  HudBar(PVector pos, float h) {
    this.pos = pos.copy();
    dimTar = new PVector(0, h);
    dim = dimTar.copy();
  }

  void update() {
    dim = PVector.lerp(dim, dimTar, 0.01);
  }

  void render() {
    fill(220, 255, 255);
    noStroke();
    rect(pos.x, pos.y, dim.x, dim.y);
  }
}

class HudBars {

  ArrayList<HudBar> bars;

  HudBars() {
    bars = new ArrayList<HudBar>();

    for ( int i = 0; i < 10; ++i ) {
      bars.add(new HudBar(new PVector(
        width*0.05 + 10, 
        10 + i * 5)
        , 4
        ));
    }
  }

  void update() {
    for ( int i = 0; i < bars.size(); ++i ) {

      if ( (frameCount + (i*999)) % 100 == 0 ) {
        bars.get(i).dimTar.x = random(30, 100);
      }

      bars.get(i).update();
    }
  }

  void render() {
    for ( HudBar h : bars ) {
      h.render();
    }
  }
}
