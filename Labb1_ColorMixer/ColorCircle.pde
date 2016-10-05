class ColorCircle
{
  int posX, posY;
  int radius;
  color circleColor;
  boolean stateChanged;

  ColorCircle(int x, int y, int r, color c)
  {
    posX = x;
    posY = y;
    radius = r;
    circleColor = c;
  }

  void update()
  {
    if (MouseOver())
    {
      strokeWeight(3);
      stroke(255);
    } else {
      strokeWeight(1);
      stroke(0);
    }

    fill(circleColor);
    ellipse(posX, posY, radius, radius);
  }

  boolean MouseOver()
  {
    return dist(posX, posY, mouseX, mouseY) < radius / 2;
  }
}