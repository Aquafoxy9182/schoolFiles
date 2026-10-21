using System.Linq.Expressions;

Random rnd = new Random();

int getal = rnd.Next(1,101);

Console.WriteLine("raad een getal tussen 1 - 100: ");

while(true)
{
    int gok = int.Parse(Console.ReadLine());
    if(gok == getal)
    {
        Console.WriteLine("yipiie je hebt het correct");
        break;
    }
    else if(gok > getal)
    {
        Console.WriteLine("wronggg lager");
    }
    else if(gok < getal)
    {
        Console.WriteLine("wronggg hoger");
    }
}