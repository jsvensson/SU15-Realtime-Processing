color tileColorA = getRandomColor();
color tileColorB = getRandomColor();

color[] rgbColors = {
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255)
};

int colorCircleSize = 150;
int selectedCircle = 0;

ColorCircle[] colorCircles = {
  new ColorCircle(100, 220, colorCircleSize),
  new ColorCircle(280, 220, colorCircleSize),
  new ColorCircle(460, 220, colorCircleSize)
};


void setup()
{
  size(560, 320);
  fill(128);
}

void draw()
{
  drawTiles();
  drawCircles();
}

void drawTiles()
{
  // Tile A
  fill(tileColorA);
  rect(20, 20, 240, 100);

  // Tile B
  fill(tileColorB);
  rect(300, 20, 240, 100);
}

void drawCircles()
{
  // Red circle
  setCircleColors(0);
  ellipse(100, 220, colorCircleSize, colorCircleSize);

  // Green circle
  setCircleColors(1);
  ellipse(280, 220, colorCircleSize, colorCircleSize);

  // Blue circle
  setCircleColors(2);
  ellipse(460, 220, colorCircleSize, colorCircleSize);
}

color getRandomColor()
{
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));

  return color(r, g, b);
}

void selectCircle(int c)
{
  selectedCircle = c;
}

void setCircleColors(int c)
{
  fill(rgbColors[c]);

  if (selectedCircle == c)
  {
    strokeWeight(5);
    stroke(255);
  } else {
    strokeWeight(0);
    stroke(0);
  }
}

boolean circleCircleInterSects(int c1x, int c1y, int c1r, int c2x, int c2y, int c2r)
{
  return dist(c1x, c1y, c2x, c2y) < c1r + c2r;
}

boolean circleMouseInterSects(int cx, int cy, int cr)
{
  return dist(cx, cy, mouseX, mouseY) < cr;
}