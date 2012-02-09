void star(float x, float y, float radius1, int numPoints, float capX, float capY) {
  float radius2 = radius1*0.4;
  float angle=TWO_PI/((float)numPoints*2);

  pushMatrix();
  translate(x, y*1.009);

  beginShape();
  vertex(0, 0);
  vertex(radius1*-0.5, max(capX*-1, capY));
  vertex(radius1*0.5, max(capX, capY));
  endShape();

  rotate(radians(180));

  beginShape();
  for (int i=0;i<numPoints*2;i+=2) {
    vertex(radius1*sin(angle*i), radius1*cos(angle*i));
    vertex(radius2*sin(angle*(i+1)), radius2*cos(angle*(i+1)));
  }
  endShape();

  popMatrix();
}

