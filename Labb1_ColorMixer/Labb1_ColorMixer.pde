color tileColorA = color(20, 20, 20); //<>//

color tileColorB = color(0, 0, 0);

// Extract RGB values from tile A
int[] correctColors = {20, 20, 20};

// Currently picked color from circles
int[] chosenColor = {0, 0, 0};

// State for correct color found
boolean[] colorMatch = {false, false, false};

// Correct color tolerance
int colorTolerance = 16;

// Various states
boolean foundCorrectColor = false;
boolean havePrintedWinMessage = false;

// Fill color of color circles
color[] rgbCircleColors = {
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255)
};

int colorCircleDiameter = 150;
int selectedColor = 0;

ColorCircle[] colorCircles = {
  new ColorCircle(100, 220, colorCircleDiameter, rgbCircleColors[0]), 
  new ColorCircle(280, 220, colorCircleDiameter, rgbCircleColors[1]), 
  new ColorCircle(460, 220, colorCircleDiameter, rgbCircleColors[2])
};

// Key press state
boolean keyDown = false;

void setup()
{
  size(560, 320);
  fill(128);
}

void draw()
{
  updateColorPicker();
  updateSelectedCircle();
  drawTiles();
  drawCircles();
  checkMatchingColors();
  checkIfGameFinished();
}

void drawTiles()
{
  stroke(0);
  strokeWeight(1);

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
    colorCircles[i].Update();
  }
}

void updateSelectedCircle()
{
  for (int i = 0; i < colorCircles.length; i++)
  {
    int oldColor = selectedColor;
    if (mouseOverCircle(colorCircles[i].x, colorCircles[i].y, colorCircles[i].diameter))
    {
      if (oldColor != i)
      {
        selectedColor = i;
        println("Changed selected circle to " + i);
      }
    }
  }
}

void updateColorPicker()
{
  int r = chosenColor[0];
  int g = chosenColor[1];
  int b = chosenColor[2];

  tileColorB = color(r, g, b);
}

void checkMatchingColors()
{
  for (int i = 0; i <= 2; i++)
  {
    colorMatch[i] = colorInRange(chosenColor[i], correctColors[i], colorTolerance);
  }

  if (correctColorFound())
  {
    foundCorrectColor = true;
  } else {
    foundCorrectColor = false;
  }
}

void checkIfGameFinished()
{
  if (foundCorrectColor && !havePrintedWinMessage)
  {
    println("Found the right color!");
    havePrintedWinMessage = true;
  } else {
    havePrintedWinMessage = false;
  }
}

boolean colorInRange(int value, int target, int range)
{
  return (value <= target + range) && (value >= target - range);
}

boolean correctColorFound()
{
  return colorMatch[0] && colorMatch[1] && colorMatch[2];
}

void keyPressed()
{
  int newColor = chosenColor[selectedColor];

  switch(key)
  {
  case 'w':
  case 'W':
    newColor = MaxColor(++newColor);
    break;
  case 's':
  case 'S':
    newColor = MaxColor(--newColor);
    break;
  }

  chosenColor[selectedColor] = newColor;
  println("Chosen color is now " + newColor);
}