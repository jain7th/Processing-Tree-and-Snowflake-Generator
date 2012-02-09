void holidaytree(float x, float y, float tSize) {
  //set deco possibilities
  int decoStarPoss = 5;
  int decoBallsPoss = 1;
  int decoChainPoss = -1;
  int decoGiftsPoss = 4;

  int arrayLenghts = 30;

  boolean bezierTrees = true;



  float snowDensity = random(5, 14);

  float[] tArmX = new float[arrayLenghts];
  float[] tArmY = new float[arrayLenghts];

  float[] tArmMidX = new float[arrayLenghts];
  float[] tArmMidY = new float[arrayLenghts];

  //generate tree genes
  float treeWidth = tSize*random(0.4, 0.6);
  float treeHeight = tSize*random(1, 2);
  float treeNeedlesHeight = treeHeight*random(0.7, 0.8);
  float treeTrunkWidth = tSize*random(0.1, 0.2);
  int treeArms = floor(random(3, 5));

  float tArmBezXBase = (treeWidth*0.5)/treeArms;
  float tArmBezYBase = treeNeedlesHeight/treeArms;

  float snowSize;
  float snowX;
  float snowY;
  float snowPos;

  float chainBallSize;
  float[] chainBallNum = new float[2];
  color chainColor;

  float[] chainMiddleX = new float[arrayLenghts];
  float[] chainMiddleY = new float[arrayLenghts];

  float[] ran1 = new float[arrayLenghts];
  float[] ran2 = new float[arrayLenghts];
  float[] ran3 = new float[arrayLenghts];
  float[] ran4 = new float[arrayLenghts];


  tArmX[0] = 0;
  tArmY[0] = -treeHeight;

  //generate main arm points
  for (int i = 1; i <= treeArms*2; i++) {
    if (i%2 != 0) {
      tArmX[i] = (tArmBezXBase*-1)*i*random(0.95, 1.05);
      tArmY[i] = (treeHeight*-1) + tArmBezYBase*i*0.7*random(0.95, 1.02);
    } 
    else {
      tArmX[i] = tArmX[i-1] + tArmBezXBase*0.8 * (i/(treeArms*0.8))*random(0.95, 1.05);
      tArmY[i] = tArmY[i-1] - tArmBezYBase*0.1*random(0.8, 1.2);
    }
  }

  tArmX[treeArms*2] = 0;
  tArmY[treeArms*2] = (-treeHeight)+treeNeedlesHeight*1.08;


  pushMatrix();
  translate(x, y);

  //draw Tree  
  ////draw trunk
  noFill();
  strokeCap(ROUND);
  stroke(random(6, 9), 80, 80);
  strokeWeight(treeTrunkWidth);
  line(0, 0, 0, -treeHeight*0.42);



  ////draw trunk snow
  for (int i = 0; i < snowDensity*0.75; i++) {
    noStroke();
    fill(random(50, 100), 3, random(85, 95));
    snowSize = random(tSize*0.02, tSize*0.18);
    ellipse(random(treeTrunkWidth*-0.6, treeTrunkWidth*0.6), random(treeTrunkWidth*-0.1, treeTrunkWidth*0.4), snowSize, snowSize);
  }



  ////draw green needles
  noStroke();
  fill(random(20, 25), 80, 80);

  pushMatrix();

  if (bezierTrees) {
    for (int i = 0; i < 2; i++) {
      if (i == 1) scale(-1, 1);

      beginShape();
      vertex(tArmX[0], tArmY[0]);

      for (int j = 0; j < treeArms*2; j+=2) {
        ran1[j] = random(0.4, 0.6);
        ran2[j] = random(0.3, 0.5);
        ran3[j] = random(0.1, 0.3);
        ran4[j] = random(0.2, 0.4);


        bezierVertex(tArmX[j] - tArmBezXBase*ran1[j], tArmY[j] + tArmBezYBase*ran2[j], tArmX[j+1] + tArmBezXBase*ran3[j], tArmY[j+1] - tArmBezYBase*ran4[j], tArmX[j+1], tArmY[j+1]);
        bezierVertex(tArmX[j+1] + tArmBezXBase*random(0.1, 0.2), tArmY[j+1] - tArmBezYBase*random(0.01, 0.1), tArmX[j+2] - tArmBezXBase*random(0.1, 0.2), tArmY[j+2] + tArmBezYBase*random(0.1, 0.2), tArmX[j+2], tArmY[j+2]);
      }
      endShape();
    }
  } 
  else {
    for (int i = 0; i < 2; i++) {
      if (i == 1) scale(-1, 1);

      beginShape();
      vertex(tArmX[0], tArmY[0]);

      for (int j = 0; j < treeArms*2; j+=2) {
        ran1[j] = random(0.4, 0.6);
        ran2[j] = random(0.3, 0.5);
        ran3[j] = random(0.1, 0.3);
        ran4[j] = random(0.2, 0.4);


        bezierVertex(tArmX[j], tArmY[j], tArmX[j+1], tArmY[j+1], tArmX[j+1], tArmY[j+1]);
        bezierVertex(tArmX[j+1], tArmY[j+1], tArmX[j+2], tArmY[j+2], tArmX[j+2], tArmY[j+2]);
      }
      endShape();
    }
  }

  ////draw star
  if (floor(random(decoStarPoss)) == 0) {
    fill(random(8, 12), 90, random(85, 95));
    star(0, -treeHeight, (dist(tArmX[1], 0, -tArmX[1], 0))*0.6, 5, dist(bezierPoint(tArmX[0], tArmX[0] - tArmBezXBase*ran1[0], tArmX[1] + tArmBezXBase*ran3[0], tArmX[1], 0.4), 0, 0, 0), dist(0, bezierPoint(tArmY[0], tArmY[0] + tArmBezYBase*ran2[0], tArmY[1] - tArmBezYBase*ran4[0], tArmY[1], 0.4), 0, -treeHeight));
  }

  ////draw chain
  if (floor(random(decoChainPoss)) == 0) {
    chainColor = color(random(8, 12), 90, random(85, 95));

    chainBallSize = random(tSize*0.01, tSize*0.03);

    for (int i = 1; i < treeArms; i++) {
      chainMiddleX[i] = random(dist(0, 0, tArmX[i]*0.4, 0), dist(0, 0, tArmX[i], 0*0.6));
      chainMiddleY[i] = random(tArmY[i]*0.9, tArmY[i]*1.2);
      chainBallNum[0] = dist(chainMiddleX[i], chainMiddleY[i], -tArmX[i], tArmY[i])*2.0;
      chainBallNum[1] = dist(chainMiddleX[i], chainMiddleY[i], tArmX[i], tArmY[i])*2.0;
      chainBallSize = dist(-tArmX[i], tArmY[i], tArmX[i], tArmY[i]);


      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < chainBallNum[j]; k++) {
          fill(chainColor);
          ellipse(bezierPoint(tArmX[i], 0, 0, chainMiddleX[i], norm(k, 0, chainBallNum[j])), bezierPoint(chainMiddleY[i], 0, 0, tArmY[i], norm(k, 0, chainBallNum[j])), chainBallSize, chainBallSize);
        }
      }
    }
  }


  ////draw snow
  if (bezierTrees) {
    fill(random(50, 100), 3, random(85, 95));
    for (int i = 0; i < 2; i++) {
      if (i == 1) scale(-1, 1);

      for (int j = 0; j < treeArms*2; j+=2) {

        for (int k = 0; k < snowDensity; k++) {
          snowSize = random(tSize*0.1);
          snowPos = random(0.2, 0.85);

          snowX = bezierPoint(tArmX[j], tArmX[j] - tArmBezXBase*ran1[j], tArmX[j+1] + tArmBezXBase*ran3[j], tArmX[j+1], snowPos);
          snowY = bezierPoint(tArmY[j], tArmY[j] + tArmBezYBase*ran2[j], tArmY[j+1] - tArmBezYBase*ran4[j], tArmY[j+1], snowPos);
          ellipse(snowX, snowY, snowSize, snowSize);
        }
      }
    }
  } 
  else {
    fill(random(50, 100), 3, random(85, 95));
    for (int i = 0; i < 2; i++) {
      if (i == 1) scale(-1, 1);

      for (int j = 0; j < treeArms*2; j+=2) {

        for (int k = 0; k < snowDensity; k++) {
          snowSize = random(tSize*0.1);
          snowPos = random(0.2, 0.85);

          snowX = bezierPoint(tArmX[j], tArmX[j], tArmX[j+1], tArmX[j+1], snowPos);
          snowY = bezierPoint(tArmY[j], tArmY[j], tArmY[j+1], tArmY[j+1], snowPos);
          ellipse(snowX, snowY, snowSize, snowSize);
        }
      }
    }
  }

  //draw gift(s)
  if (floor(random(decoGiftsPoss)) == 0) {
    for (int i = 0; i < floor(map(ran1[0], 0.4, 0.6, 1, 3)); i++) {
      gift(random(tArmBezXBase*-3, tArmBezXBase*3), random(treeTrunkWidth*0.5, treeTrunkWidth*0.8), (treeHeight - treeNeedlesHeight)*random(0.5, 0.7), snowDensity);
    }
  }

  popMatrix();



  noStroke();
  noFill();
  popMatrix();
}

