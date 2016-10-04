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
  new ColorCircle(100, 220, colorCircleSize, rgbColors[0]), 
  new ColorCircle(280, 220, colorCircleSize, rgbColors[0]), 
  new ColorCircle(460, 220, colorCircleSize, rgbColors[0])
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
  for (int i = 0; i < colorCircles.length; i++)
  {
    colorCircles[i].update();
  }
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