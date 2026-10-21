using System;

namespace oef7
{
    class oef7
    {
        static void Main(string[] arg)
        {
            Console.Write("geef de temperatuur in F: ");
            int fer = Convert.ToInt32(Console.ReadLine());

            double cel = 5.0/9.0 * (fer-32);
        
            Console.WriteLine($"{fer} ferneheigt is {cel:f2} celcius");
        }
    }
}