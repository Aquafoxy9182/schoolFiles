using System;

internal class btw
{
    static void Main(string[] args)
    {
        string product = "klein wit brood";

        double prijs = 2.59;
        double btwPercentage = 6;
        double aantal = 3;

        double prijsPerProduct = prijs + ((prijs/100)*btwPercentage);

        double totaal = prijsPerProduct * aantal;
        Console.WriteLine("uw prijs is: " + Math.Round(totaal,2));
    }
}