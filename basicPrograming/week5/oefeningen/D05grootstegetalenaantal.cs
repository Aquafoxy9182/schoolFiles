int stoper = -1;
int biggestGetal = 0;
int getalCounter = 0;

while (true)
{
    Console.WriteLine("geef een getal in");
    int getal = int.Parse(Console.ReadLine());
    if(getal == -1)
    {
        Console.WriteLine(biggestGetal);
        Console.WriteLine(getalCounter);
        break;
    }
    if(biggestGetal < getal)
    {
        biggestGetal = getal;
        getalCounter = 0;
    }
    if(biggestGetal == getal)
    {
        getalCounter += 1;
    }
}