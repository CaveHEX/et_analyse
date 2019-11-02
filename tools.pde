void shuffle(PShape shp, float str) {
  for ( int i = 0; i < shp.getVertexCount(); ++i ) {
    PVector p = shp.getVertex(i);
    p.add(PVector.random3D().mult(str));
    shp.setVertex(i, p);
  }
}

void modulate(PShape shp) {
  PVector str = PVector.random3D().mult(random(100));
  PVector strWave = PVector.random3D().mult(random(50));
  PVector ex = PVector.random3D().mult(random(-0.3, 0.3));

  for ( int i = 0; i < shp.getVertexCount(); ++i ) {
    PVector p = shp.getVertex(i);
    PVector p_ = p.copy().mult(0.03);

    float n = noise(p_.x, p_.y, p_.z + frameCount);

    p.x += n * str.x + sin(p.z * ex.x) * strWave.x;
    p.y += n * str.y + cos(p.y * ex.y) * strWave.y;
    p.z += n * str.z + sin(p.x * ex.z) * strWave.z;

    shp.setVertex(i, p);
  }
}
