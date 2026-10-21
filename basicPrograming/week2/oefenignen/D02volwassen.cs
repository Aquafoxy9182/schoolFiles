using System;

namespace oef10
{
    class oef10
    {
        static void Main(string[] arg)
        {
            Console.Write("geef je leeftijd in: ");
            int age = Convert.ToInt32(Console.ReadLine());
            
            if(age >= 18)
            {
                Console.WriteLine("je bent volwassen");
            }
            else
            {
                Console.WriteLine("je bent niet volwassen");
            }
        }
    }
}