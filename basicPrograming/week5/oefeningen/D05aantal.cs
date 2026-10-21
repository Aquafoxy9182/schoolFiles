using System.Runtime.InteropServices;

int? prevGetal = null;
int repeat = 1;
while (true)
{
    Console.WriteLine("geef een getal in");
    int getal = int.Parse(Console.ReadLine());
    if(getal == prevGetal)
    {
        Console.WriteLine(repeat);
        break;
    }
    prevGetal = getal;
    repeat += 1;
}