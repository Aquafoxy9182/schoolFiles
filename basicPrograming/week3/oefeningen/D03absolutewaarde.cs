using System;

namespace oef13
{
    class oef13
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een getal op: ");
            int getal = Convert.ToInt32(Console.ReadLine());
   
            int absoluutGetal = Math.Abs(getal);

            Console.WriteLine($"|{absoluutGetal}|");
        }
    }
}