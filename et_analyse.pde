import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;
PGraphics pan;
float t = 0;

Core core;
HUD hud;

void setup() {
  size(800, 800, P3D);
  frameRate(60);
  smooth(8);

  fx = new PostFX(this);
  pan = createGraphics(width, height, P3D);
  pan.smooth(8);
  pan.beginDraw();
  pan.background(0);
  pan.endDraw();

  core = new Core();
  hud = new HUD();
}

void draw() {
  t += 0.01;

  hud.run();

  pan.beginDraw();
  alphaFade(pan);
  core.run(pan);
  pan.endDraw();

  fx.render(pan)
    .pixelate(300)
    .rgbSplit(10)
    .compose(pan);

  image(pan, 0, 0);
}
