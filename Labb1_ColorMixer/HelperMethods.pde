color getRandomColor()
{
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));

  return color(r, g, b);
}

boolean circleCircleInterSects(int c1x, int c1y, int c1r, int c2x, int c2y, int c2r)
{
  return dist(c1x, c1y, c2x, c2y) < c1r + c2r;
}

boolean circleMouseInterSects(int cx, int cy, int cr)
{
  return dist(cx, cy, mouseX, mouseY) < cr;
}