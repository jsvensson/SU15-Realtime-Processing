color getRandomColor()
{
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));

  return color(r, g, b);
}

boolean circleInterSectsCircle(int firstCircleX, int firstCircleY, int firstCircleRadius, 
  int secondCircleX, int secondCircleY, int secondCircleRadius)
{
  float d = dist(firstCircleX, firstCircleY, secondCircleX, secondCircleY);
  return d < firstCircleRadius + secondCircleRadius;
}

boolean mouseOverCircle(int circleX, int circleY, int diameter)
{
  return dist(circleX, circleY, mouseX, mouseY) < diameter / 2;
}

int MaxColor(int value)
{
  return min(255, max(0, value));
}