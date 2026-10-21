using System;
using System.Linq.Expressions;

Random pussy = new Random();

int getal = pussy.Next(1,11);

Console.Write("Ik denk aan een getal kan je het raaden?: ");
int gok = Convert.ToInt32(Console.ReadLine());

if (getal == gok)
{
    Console.WriteLine($"dat is correct het getal was {getal}");
}
else
{
   Console.WriteLine($"dat is incorrect het getal was {getal}"); 
}