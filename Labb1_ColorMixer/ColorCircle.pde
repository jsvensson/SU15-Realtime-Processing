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
    fill(circleColor);
    ellipse(posX, posY, radius, radius);
  }

  boolean mouseInterSects()
  {
    return dist(posX, posY, mouseX, mouseY) < radius;
  }
}