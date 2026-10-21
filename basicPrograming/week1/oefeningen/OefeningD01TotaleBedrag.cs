int biljettenVan10Euro = 7;
int biljettenVan5Euro = 6;
int muntstukkenVan2Euro = 5;
int muntstukkenVan1Euro = 4;
int muntstukkenVan50Cent = 3;

double totaal, totaal10 = 10, totaal5 = 5, totaal2 = 2, totaal1 = 1, totaal50Cent = 0.50;

totaal10 = biljettenVan10Euro * totaal10;
totaal5 = biljettenVan5Euro * totaal5;
totaal2 = muntstukkenVan2Euro * totaal2;
totaal1 = muntstukkenVan1Euro * totaal1;
totaal50Cent = muntstukkenVan50Cent * totaal50Cent;

totaal = totaal50Cent + totaal1 + totaal2 + totaal5 + totaal10;

Console.WriteLine("totaal is = " + totaal);
