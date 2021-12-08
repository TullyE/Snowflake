ArrayList <Flake> ml = new ArrayList <Flake> ();
void setup()
{
  size(500, 500);
  ml.add(new Flake(width, height/2));
}

void draw()
{
  background(0);

  for (Flake f : ml)
  {
    f.update();
    f.show();
    if (!f.getStopped())
    {
      if (f.isStopped(ml))
      {
        f.setIncX(0);
      }
    }
  }
  if (isAllStopped(ml))
  {
    if (ml.get(ml.size() - 1).getX() != width - 1)
    {
      ml.add(new Flake(width, height/2));
      System.out.println(ml.get(ml.size() - 2).getX());
    }
  }
}

boolean isAllStopped(ArrayList <Flake> al)
{
  boolean allStopped = true;
  for (Flake f : al)
  {
    if (!f.getStopped())
    {
      allStopped = false;
      break;
    }
  }
  return allStopped;
}
