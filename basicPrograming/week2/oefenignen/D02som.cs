using System;

namespace oef4
{
    class oef4
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een getal: ");
            int getal1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("geef een tweede getal: ");
            int getal2 = Convert.ToInt32(Console.ReadLine());

            int totaal = getal1 + getal2;
        
            Console.WriteLine($"{getal1} + {getal2} = {totaal}");
        }
    }
}