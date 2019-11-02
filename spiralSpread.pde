// Credits to : u/Simplyfire
// Spreads vertex in an even manner with a spiral

PShape makeSpiralSphere(int pointCount, int scale) {
  PShape shp = createShape();

  shp.beginShape(POINTS);

  shp.stroke(220, 255, 255);
  shp.strokeWeight(2);
  shp.noFill();

  float s  = 3.6 / sqrt(pointCount);
  float dz = 2.0 / pointCount;
  float lon = 0;
  float z = 1 - dz/2;

  for (int k = 0; k < pointCount; k++) {
    float r = sqrt(1-z*z);

    PVector p = new PVector(cos(lon), sin(lon)).mult(r);
    p.add(0, 0, z).mult(scale);
    shp.vertex(p.x, p.y, p.z);

    z = z - dz;
    lon = lon + s/r;
  }

  shp.endShape();
  return shp;
}
