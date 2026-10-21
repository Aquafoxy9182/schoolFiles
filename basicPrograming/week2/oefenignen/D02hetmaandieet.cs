using System;

namespace oef9
{
    class oef9
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een gewicht in kg: ");
            int getal1 = Convert.ToInt32(Console.ReadLine());

            double totaal = Convert.ToDouble(getal1) / 6.0;
        
            Console.WriteLine($"je gewicht op de maan zou {totaal}gk zijn");
        }
    }
}