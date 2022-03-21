# Installatie Frocole services

De Frocole App communiceert met de server doormiddel van een set PHP web services die in een separate folder zijn ondergebracht. Hiernaast is er een Drupal 9 gebaseerde beheer omgeving voor o.a. het aanmaken van cursussen.

De Frocole services kunnen eenvoudig geïnstalleerd worden door de files te kopiëren in een separate folder op de webserver (b.v. /frocole/) [^1].

De volgende stap is om de database te creëren met een tool als PhpMyAdmin en daarin de SQL-commando’s te importeren en uit te voeren [^2]. Belangrijk is dat de database 'utf8mb4_general_ci' gebruikt i.p.v. ‘latin1’ als karakter set.

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

In de config.inc file kan de variabele $develop op false gezet worden waardoor de beveiliging wordt aangescherpt (i.e. geen PHP foutmeldingen in de browser, geen phpinfo() functie en onderdrukken van het PHP versie nummer in http headers). Verder zijn de meeste webservices alleen via POST te gebruiken. Dit wordt in de .htaccess file afgedwongen.

Hierna kan de database connectie getest worden door het oproepen van de pagina’s /frocole/CheckIfServerExists.php en /frocole/CheckIfDatabaseExists.php in een webbrowser.

[^1]: Een alternatief voor unzippen en kopiëren is rechtstreeks git te gebruiken voor deployment vanuit de GitHub repository. Dit kan vanaf de command line, als de huidige folder de web root is, met het git commando: 'git clone https://github.com/Frocole/Frocole_Services.git frocole'.
[^2]: De frocole database bevat geen SQL relaties of restricties.