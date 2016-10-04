class ColorCircle
{
  int posX, posY;
  int radius;
  color circleColor;

  ColorCircle(int x, int y, int r)
  {
    posX = x;
    posY = y;
    radius = r;
  }

  boolean mouseInterSects()
  {
    return dist(posX, posY, mouseX, mouseY) < radius;
  }
}