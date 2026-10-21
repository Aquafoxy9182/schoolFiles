int stoper = -1;
int som = 0;

while (true)
{
    Console.WriteLine("geef een getal in");
    int plusser = int.Parse(Console.ReadLine());
    if(plusser == -1)
    {
        Console.WriteLine(som);
        break;
    }
    som += plusser;
}