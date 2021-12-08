
class Flake
{
  private int incX;
  private float x;
  private float y;
  private float size;

  private boolean stopped;
  Flake(float x, float y)
  {
    incX = 1;
    stopped = false;
    this.x = x;
    this.y = y;
    this.size = 5;
  }

  void update()
  {
    x -= incX;
    if (!stopped)
    {
      y += (int) (Math.random() * 5) - 2;
    }
  }

  void show()
  {
    ellipse(x, y, size * 2, size * 2);
  }

  boolean isStopped(ArrayList <Flake> al)
  {

    boolean stopped = false;
    for (Flake f : al)
    {
      if (x < width/2)
      {
        stopped = true;
        this.stopped = true; 
        break;
      }
      if (this != f)
      {
        double d = dist(f.getX(), f.getY(), this.x, this.y);
        if (d < size * 2 || x < width/2)
        {
          this.stopped = true;
          stopped = true;
          break;
        }
      }
    }
    return stopped;
  }

  float getY()
  {
    return this.y;
  }

  float getX()
  {
    return this.x;
  }

  boolean getStopped()
  {
    return this.stopped;
  }

  void setIncX(int inc)
  {
    this.incX = inc;
  }

  void setX(int x)
  {
    this.x = x;
  }

  void setY(int y)
  {
    this.y = y;
  }
}
