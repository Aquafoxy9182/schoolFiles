Console.WriteLine("Geef een int");

if (int.TryParse(Console.ReadLine(), out int getal))
{
    Console.WriteLine("okii");
}
else
{
    Console.WriteLine("Dit is geen geldig geheel getal!");
}