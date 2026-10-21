Console.Write("geef eerste getal: ");
int getal1 = Convert.ToInt32(Console.ReadLine());

Console.Write("geef tweede getal: ");
int getal2 = Convert.ToInt32(Console.ReadLine());

if(getal1 > getal2)
{
    Console.WriteLine($"{getal2} is kleiner");
}
else if(getal1 < getal2)
{
    Console.WriteLine($"{getal1} is kleiner");
}
else
{
    Console.WriteLine("ze zijn gelijk");
}
