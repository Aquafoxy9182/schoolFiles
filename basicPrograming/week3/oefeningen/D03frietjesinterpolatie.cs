using System;

namespace oef1
{
    class oef1
    {
        static void Main(string[] arg)
        {
            Console.Write("geef een naam op: ");
            string name1 = Console.ReadLine();
            Console.WriteLine("geef een andere naam op: ");
            string name2 = Console.ReadLine();
            
            Console.WriteLine("geef ook een gerecht: ");
            string eten = Console.ReadLine();

            Console.WriteLine($"{name1} en {name2} eten graag {eten}.");
        }
    }
}