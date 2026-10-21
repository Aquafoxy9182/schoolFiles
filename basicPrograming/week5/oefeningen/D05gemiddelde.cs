int stoper = -1;
int som = 0;
int somCount = 0;

while (true)
{
    Console.WriteLine("geef een getal in");
    int plusser = int.Parse(Console.ReadLine());
    if(plusser == -1)
    {
        som = som / somCount;
        Console.WriteLine(som);
        break;
    }
    som += plusser;
    somCount += 1;
}