Console.Write("Rechthoekzijde?: ");
int zijde = int.Parse(Console.ReadLine());

while(zijde > 0)
{
    Console.WriteLine(new string('*' , zijde));
    zijde -= 1;
}