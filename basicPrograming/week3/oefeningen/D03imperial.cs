const double FeetTocmCon = 30.48;
const double cmToFeetCon = 2.54;

Console.Write("Geef het aantal feet : ");
string aantalFeetAlsTekst = Console.ReadLine();
double aantalFeet = double.Parse(aantalFeetAlsTekst);

Console.Write("Geef het aantal inches : ");
string aantalInchesAlsTekst = Console.ReadLine();
double aantalInches = double.Parse(aantalInchesAlsTekst);

double aantalFeetInCm = aantalFeet * FeetTocmCon;
double aantalInchesInCm = aantalInches * cmToFeetCon;

double totaalInCm = aantalFeetInCm + aantalInchesInCm;

Console.WriteLine($"Dat is {totaalInCm}cm.");