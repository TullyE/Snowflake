
class Flake
{
  private int incX;
  private float x;
  private float y;
  private float size;
  private int yVar;
  private int xVar;
  private float tP;

  private boolean stopped;
  Flake(float x, float y, float tP)
  {
    this.tP = tP;
    this.yVar = 0;
    this.xVar = 11; //10 is Special!!
    this.incX = 1;
    this.x = x;
    this.y = y + (int) (Math.random() * yVar) - yVar/2;
    this.size = 5;
  }

  void update()
  {
    x -= incX;
    if (!stopped)
    {
      y += (int) (Math.random() * xVar) - xVar/2;
    }
  }

  void show()
  {
    this.tP = 255;
    stroke(255, 255, 255, 255 - tP);
    fill(255, 255, 255, tP);
    //noStroke();
    ellipse(x, y, size * 2, size * 2);
  }

  boolean isStopped(ArrayList <Flake> al)
  {

    boolean stopped = false;
    for (Flake f : al)
    {
      if (x < 0)
      {
        stopped = true;
        this.stopped = true;
        break;
      }
      if (this != f)
      {
        double d = dist(f.getX(), f.getY(), this.x, this.y);
        if (d < size * 2 || x < 0)
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

  void setStopped(boolean stop)
  {
    this.stopped = stop;
  }
}
