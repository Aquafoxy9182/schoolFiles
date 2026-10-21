using System;

namespace oef12
{
    class oef12
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een getal: ");
            double getal1 = Convert.ToDouble(Console.ReadLine());
            Console.Write("geef nog een deler: ");
            double deler = Convert.ToDouble(Console.ReadLine());
            
            if(deler == 0)
            {
                Console.WriteLine("deling door 0 is niet toegestaan");
            }
            else
            {
                double totaal = getal1 / deler;
                Console.WriteLine($"{getal1} / {deler} = {totaal}");
            }
        }
    }
}