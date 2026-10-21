Console.Write("Temperatuur?: ");
int temperatuur = int.Parse(Console.ReadLine());

bool hetVriest = (temperatuur <= 0);
if (hetVriest) {
    Console.WriteLine("Bij deze temperatuur vriest het.");
}

Console.Write("Dank je voor het invoeren van de ");
if (!hetVriest) { // 
    Console.Write("warme ");
}
Console.Write("temperatuur.");