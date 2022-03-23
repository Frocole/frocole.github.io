# Installatie Frocole services

De Frocole App communiceert met de server doormiddel van een set PHP web services die in een separate folder zijn ondergebracht. Hiernaast is er een Drupal 9 gebaseerde beheer omgeving voor o.a. het aanmaken van cursussen.

De Frocole services kunnen eenvoudig geïnstalleerd worden door de files te kopiëren in een separate folder op de webserver (b.v. '/frocole/') [^1].

De volgende stap is om de frocole database[^2] te creëren met een tool als PhpMyAdmin en daarin de SQL-commando’s uit 'frocole.sql' te importeren en uit te voeren [^3]. Belangrijk is dat de database 'utf8mb4_general_ci' gebruikt i.p.v. 'latin1' als karakter set.

De schema van de database[^4] ziet er als volgt uit:

![image](https://user-images.githubusercontent.com/1768983/158581828-458b9e97-6100-4049-a242-f5051a3e11aa.png)

Daarna is de volgende stap om de database inlog gegevens te definiëren. Standaard gebruikt Frocole services een 'config.inc' file die een 'frocole_db.ini' file leest die net buiten de web root staat. In deze laatste file staan de inlog gegevens van de MySQL database.

Deze 'frocole_db.ini' file heeft het volgende formaat:

```
    [database]
    host = <mysql hostname>
    port = <mysql poortnummer>
    schema = <frocole_database_name>
    username = <mysql user>
    password = <mysql user>
```
 
De diverse waarden moeten gelijk zijn als datgene wat aan Drupal’s 'settings.php' toegevoegd worden als deel van de installatie van de Frocole beheer module.

In de 'config.inc' file kan de variabele $develop op false gezet worden waardoor de beveiliging wordt aangescherpt (i.e. geen PHP foutmeldingen in de browser, geen 'phpinfo()' functie en onderdrukken van het PHP versie nummer in http headers). Verder zijn de meeste webservices alleen via POST te gebruiken. Dit wordt in de '.htaccess' file afgedwongen.

Hierna kan de database connectie getest worden door het oproepen van de pagina’s '/frocole/CheckIfServerExists.php' en '/frocole/CheckIfDatabaseExists.php' in een webbrowser [^5].

## Voetnoten:
[^1]: Een alternatief voor unzippen en kopiëren is rechtstreeks git te gebruiken voor deployment vanuit de GitHub repository. Dit kan vanaf de command line, als de huidige folder de web root is, met het git commando: 'git clone https://github.com/Frocole/Frocole_Services.git frocole'.
[^2]: Indien een andere database naam dan 'frocole' gewenst is, moet dit zowel in het bovenstaande commando als in het sql bestand aangepast worden (zie de regels 20 tot 24).
[^3]: Dit kan met een commando: 'mysql –u{mysql username} –p{mysql password} –h{mysql host} –P{mysql port} frocole < {*.sql bestandnaam}'.
[^4]: Relaties tussen de tabellen worden door de app en de services gedefinieerd, er worden dus geen SQL relaties in de database gebruikt.
[^5]: De frocole database bevat geen SQL relaties of restricties.
