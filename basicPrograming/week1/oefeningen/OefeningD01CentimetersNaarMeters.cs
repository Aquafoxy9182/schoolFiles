using System;

namespace oef2
{
    class oef2
    {
        static void Main(string[] arg)
        {   
            Console.WriteLine("dit is een converter can cm naar m");
            Console.Write("geef de cm in: ");
            string input = Console.ReadLine();
            double trueMeter = double.Parse(input);
            int meter = int.Parse(input);
            double overigeCm;

            Console.WriteLine("cm = " + input);

            trueMeter = trueMeter / 100;
            meter = meter / 100;
            overigeCm = trueMeter - meter;

            Console.WriteLine("m = " + meter);
            Console.WriteLine("en cm = " + Math.Round(overigeCm,2));
        }
    }
}