const int Converter = 60;
const int urenInSec = 3600;

Console.WriteLine("geef een geheel getal in sec");
int sec = Convert.ToInt32(Console.ReadLine());

double minAantal = Convert.ToDouble(sec) / Convert.ToDouble(Converter);
double urenAantal = minAantal / Convert.ToDouble(Converter);

Console.WriteLine($"{sec} aantal sec is gelijk aan {minAantal} min");
Console.WriteLine($"{sec} aantal sec is gelijk aan {urenAantal:f4} uren");

Console.WriteLine();
Console.WriteLine("second solutution");

int uren = sec / urenInSec;
int minuten = (sec % urenInSec) / Converter;
int resterendeSeconden = sec % Converter;

Console.WriteLine($"{uren} uur, {minuten} minuten en {resterendeSeconden} seconden");
