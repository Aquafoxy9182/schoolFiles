using System.Threading.Tasks.Dataflow;

internal class Program
{
    static void Main(string[]arg)
    {
        int leeftijd = 56; // dit is een int een geheel getal
        string voornaam = "jhon"; // dit is een string een text
        double geld = 6; // dit is een double een coma getal
        if (geld < 5)
        {
             Console.WriteLine(leeftijd + " " + voornaam + "broke");
        }
        else
        {
             Console.WriteLine(leeftijd + " " + voornaam + " rich");
        }
    }
}