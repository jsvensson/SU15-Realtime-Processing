int cursorSize = 100;
int elapsedTime = -1;
String typedKeys = "";

void setup() {
  size(500, 500);

  // Default fill
  fill(255, 0, 0, 128);

  // Default stroke
  strokeWeight(3);
}

void draw() {
  background(160);

  // Clip rectangle position to window edges
  rectMode(CENTER);
  int posX = min(max(cursorSize / 2, mouseX), 450);
  int posY = min(max(cursorSize / 2, mouseY), 450);

  changeStrokeColor();
  rect(posX, posY, cursorSize, cursorSize, 16);

  if (second() != elapsedTime)
  {
    elapsedTime = second();
  }

  text(elapsedTime, 10, 20);
}

void changeStrokeColor()
{
  color[] strokeColors = {
    color(255, 0, 0), 
    color(0, 255, 0), 
    color(0, 0, 255), 
    color(255, 255, 0), 
    color(255, 0, 255), 
    color(0, 255, 255)
  };

  int current = second() % strokeColors.length;
  stroke(strokeColors[current]);
}

void mousePressed()
{
  fill(0, 255, 0, 128);
}

void mouseReleased()
{
  fill(255, 0, 0, 128);
}

void mouseDragged()
{
  fill(255, 0, 255, 128);
}

void keyTyped()
{
  if (key == ENTER || key == RETURN)
  {
    println(typedKeys);
    typedKeys = "";
  } else {
    typedKeys += key;
  }
}