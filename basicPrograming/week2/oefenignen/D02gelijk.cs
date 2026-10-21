using System;

namespace oef11
{
    class oef11
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een getal: ");
            int getal1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("geef nog een getal: ");
            int getal2 = Convert.ToInt32(Console.ReadLine());
            
            if(getal1 == getal2)
            {
                Console.WriteLine("gelijk");
            }
            else
            {
                Console.WriteLine("niet gelijk");
            }
        }
    }
}