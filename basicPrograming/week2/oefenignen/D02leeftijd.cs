using System;

namespace oef2
{
    class oef2
    {
        static void Main(string[] arg)
        {
            Console.Write("geef je naam op: ");
            string name1 = Console.ReadLine();
            Console.WriteLine("geef je leeftijd: ");
            int age = Convert.ToInt32(Console.ReadLine());
        

            Console.WriteLine($"goedendag, {name1} je bent dus {age} jaar oud!");
        }
    }
}