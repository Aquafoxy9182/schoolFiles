for (int countdown = 3; countdown > 0; countdown--)
{
    Console.WriteLine($"Spel start over {countdown} seconden...");
    Thread.Sleep(1000);
}

Random rnd = new();

while (true)
{
    int randomkleur = rnd.Next(1,5);
    int randomLedemaat = rnd.Next(1,5);
    Console.WriteLine(randomGetal);
    break;
}
