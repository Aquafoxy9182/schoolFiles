Console.WriteLine("geef mij het woord");

string woord = Console.ReadLine();

Console.WriteLine("geef mij het aantal repeats");

int repeats = Convert.ToInt32(Console.ReadLine());

int startRepeat = 1;

while (startRepeat < repeats)
{
    Console.Write($"{woord}");
    startRepeat += 1;
}

string woordCap = woord.ToUpper();
Console.Write($"{woordCap}");