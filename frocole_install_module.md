# Installatie Frocole beheer module voor Drupal 9

De Frocole beheer module is getest met Drupal 9.2.x maar zou compatible moeten zijn met zowel Drupal 9.3.x en Drupal 8.
De Frocole beheer module voor Drupal 9 moet staan in een /modules/custom folder. De frocole.install files staat aldus in de /modules/custom/frocole folder.

Installation omvat 3 stappen:

- Download en kopieer de sources van de module in de /modules/custom/frocole folder (Hiermee komt het frocole.install bestand in de /modules/custom/frocole folder te staan) [^1].
- Bewerk de Drupal 9 config file ( /sites/default/settings.php ) en voeg de volgende PHP code toe:
```
    $databases["frocole"]["default"] = array (
      "database" => "<frocole_database_name>",
      "username" => "<mysql user>",
      "password" => "<mysql pw>",
      "prefix" => "",
      "host" => "<mysql hostname>",
      "port" => "3306",
      "namespace" => "Drupal\\Core\\Database\\Driver\\mysql",
      "driver" => "mysql",
    );
```
en vervang in bovenstaande de gemarkeerde stukken door de correcte waarden.
- Hierna kan de Frocole Module aangezet worden binnen Drupal via de beheer URL: /admin/modules .
Na aanzetten zijn de beheerpagina’s van de module te vinden via de ‘/admin/frocole/index’ URL

[^1]: Een alternatief voor unzippen en kopiëren is rechtstreeks git te gebruiken voor deployment vanuit de GitHub repository. Dit kan vanaf de command line, als de huidige folder /modules/custom is (binnen de Drupal 9 installatie), met het git commando: 'git clone https://github.com/Frocole/Frocole_Module.git frocole'.
