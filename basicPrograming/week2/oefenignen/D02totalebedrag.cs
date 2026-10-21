using System;

namespace oef5
{
    class oef5
    {
        static void Main(string[] arg)
        {
            Console.Write("geef hoeveel muntstucken van 2 je hebt: ");
            int getal1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("geef hoeveel muntstucken van 1 je hebt: ");
            int getal2 = Convert.ToInt32(Console.ReadLine());

            int totaal = (getal1 * 2) + getal2;
        
            Console.WriteLine($"je totaal bedrag is {totaal} $");
        }
    }
}