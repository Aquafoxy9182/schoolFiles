using System.Diagnostics.CodeAnalysis;

int baseGetal = 7;
int factor = 1;

do
{
    int sum = factor * baseGetal;
    Console.WriteLine($"{factor} x {baseGetal} = {sum}");
    factor += 1;
} while(factor <= 10);