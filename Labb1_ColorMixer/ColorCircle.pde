class ColorCircle
{
  int x, y;
  int diameter;
  color circleColor;
  color strokeColor;

  ColorCircle(int x, int y, int diameter, color c)
  {
    this.x = x;
    this.y = y;
    this.diameter = diameter;

    // Colors
    circleColor = c;
    strokeColor = 0;  // Default black
  }

  void Update()
  {
    UpdateStroke();

    fill(circleColor);
    ellipse(x, y, diameter, diameter);
  }

  void UpdateStroke()
  {
    if (MouseOver())
    {
      strokeWeight(3);
      stroke(255);
    } else {
      strokeWeight(1);
      stroke(0);
    }
  }

  boolean MouseOver()
  {
    return dist(x, y, mouseX, mouseY) < diameter / 2;
  }
}