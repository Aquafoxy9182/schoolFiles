using System;

Console.WriteLine("geef de breete: ");

double breete = Convert.ToDouble(Console.ReadLine());

Console.WriteLine("geef de lengte: ");

double lengte = Convert.ToDouble(Console.ReadLine());

double cPow2 = Math.Pow(breete, 2) + Math.Pow(lengte, 2);

double zijde = Math.Sqrt(cPow2);

Console.WriteLine($"de lengte van de shijne zijde is {zijde}");