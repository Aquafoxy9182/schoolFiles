using System;

namespace oef12
{
    class oef12
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een getal in: ");
            int getal = Convert.ToInt32(Console.ReadLine());

            double evenOneven = getal % 2;
            
            if(evenOneven == 0)
            {
                Console.WriteLine("je getal is even");
            }
            else
            {
                Console.WriteLine("je getal is oneven");
            }
        }
    }
}