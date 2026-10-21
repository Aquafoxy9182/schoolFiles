using System;

namespace oef8
{
    class oef8
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een getal tussen [0,1000]: ");
            int getal = Convert.ToInt32(Console.ReadLine());

            int eenheid = getal % 10;
            int tiende = ((getal % 100) - eenheid)/ 10;
            int hondert = ((getal % 1000) - (getal % 100))/ 100;
        
            Console.WriteLine($"{hondert} x 100");
            Console.WriteLine($"{tiende} x 10");
            Console.WriteLine($"{eenheid} x 1");
        }
    }
}