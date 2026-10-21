using System;

namespace oef3
{
    class oef3
    {
        static void Main(string[] arg)
        {
            Console.Write("geef je naam op: ");
            string name1 = Console.ReadLine();
            Console.WriteLine("geef je leeftijd: ");
            int age = Convert.ToInt32(Console.ReadLine());

            int ageInOneYear = age + 1;
        
            Console.WriteLine($"oei oei, {name1} je bent volgend jaar {ageInOneYear} jaar oud :(");
        }
    }
}