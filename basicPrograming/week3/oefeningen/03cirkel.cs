Console.WriteLine("geef mij de straal van jouw circel");
double straal = Convert.ToDouble(Console.ReadLine());

double omtrek = (2.0 * Math.PI) * straal;
double opervlakte = Math.PI * Math.Pow(straal,2);

Console.WriteLine($"de optrek = {omtrek:f2}");
Console.WriteLine($"de opervlakte = {opervlakte:f2}");
