// Credits to : u/Simplyfire
// Properly fades a screen to black

void alphaFade(PGraphics pg) {
  pg.noStroke();
  pg.hint(DISABLE_DEPTH_TEST);
  pg.pushStyle();
  pg.blendMode(SUBTRACT);
  pg.fill(255, 10); //the coolest alpha values are near zero
  pg.rectMode(CENTER);
  pg.rect(0, 0, width*2, height*2);
  pg.hint(ENABLE_DEPTH_TEST);
  pg.popStyle();
}
