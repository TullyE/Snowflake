ArrayList <Flake> ml = new ArrayList <Flake> ();
float transparency = 200;

int branches = 6;
void setup()
{
  size(1000, 1000);
  ml.add(new Flake(width/2, 0, transparency));
  //frameRate(15);
}

void draw()
{
  //Flake opp = new Flake(0, 0);
  background(0);

  while (!isAllStopped(ml))
  {
    for (Flake f : ml)
    {
      f.update();
      if (!f.getStopped())
      {
        if (f.isStopped(ml))
        {
          f.setIncX(0);
        }
      }
    }
  }
  for (Flake f : ml)
  {
    pushMatrix();
    translate(width/2, height/2);
    for (int i = 0; i < branches; i ++)
    {
      rotate(radians(360 / branches));
      f.show();
      ShowAndMirror(f);
    }
    popMatrix();
  }
  if (isAllStopped(ml))
  {
    if (ml.get(ml.size() - 1).getX() <  350) // default is 499
    {
      ml.add(new Flake(width/2, 0, transparency));
      if (ml.size() > 125)
      {
        transparency = transparency > 0 ? transparency -= 1 : 0;
        System.out.println(ml.size());
      }
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

void ShowAndMirror(Flake f)
{
  f.show();
  pushMatrix();
  scale(1, -1);
  //translate(0, -1 * height);
  f.show();
  popMatrix();
}

void mousePressed()
{
  save("CoolSnowFlake.png");
}
