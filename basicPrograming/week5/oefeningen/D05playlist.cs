Console.Write("Aantal liedjes in de playlist?: ");
string aantalLiedjesAlsTekst = Console.ReadLine();

int aantalLiedjes;
bool invoerOk = int.TryParse(aantalLiedjesAlsTekst, out aantalLiedjes);

if (invoerOk && aantalLiedjes >= 1) {
    int faculteit;

    

    string meervoud = "";
    if (faculteit > 1) {
        meervoud = "s";
    }
    Console.Write($"{aantalLiedjes} liedje{meervoud} kan je in {faculteit} verschillende volgorde{meervoud} in een playlist plaatsen.");
}