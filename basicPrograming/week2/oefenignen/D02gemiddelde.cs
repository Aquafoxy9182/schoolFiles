using System;

namespace oef6
{
    class oef6
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een comma getal: ");
            double getal1 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("geef nog een comma getal: ");
            double getal2 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("geef nog een comma getal: ");
            double getal3 = Convert.ToDouble(Console.ReadLine());

            double totaal = (getal1 + getal2 + getal3)/3;
        
            Console.WriteLine($"het gemidelde is {totaal}");
        }
    }
}