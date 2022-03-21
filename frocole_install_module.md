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
en vervang in bovenstaande de gemarkeerde stukken door de correcte waarden ( b.v. vervang "<frocole_database_name>" -> "frocole" ).
- Hierna kan de Frocole Module aangezet worden binnen Drupal via de beheer URL: '/admin/modules' .
- Na activering van de module kunnen de Frocole Services beheerd worden via de '/admin/frocole/index' link binnen Drupal 9. Deze url is het startpunt vanwaar de database van de Frocole Web Services te beheren is. Deze pagina bevat naast de mogelijkeid om cursussen toe te voegen, te wijzigen en te verwijderen ook het exporteren van groepsdata, het beheren van additionele info voor in de app en het segmenteren van de gebruikers in kleinere groepen.
- Als een cursus bekeken wordt, dan krijgt men ook een lijst van groepen en studenten binnen deze groepen van een cursus te zien. De links met de ID's van de groepen dienen voor de export naar CSV formaat, compatibel met Microsoft Excel®.

[^1]: Een alternatief voor unzippen en kopiëren is rechtstreeks git te gebruiken voor deployment vanuit de GitHub repository. Dit kan vanaf de command line, als de huidige folder /modules/custom is (binnen de Drupal 9 installatie), met het git commando: 'git clone https://github.com/Frocole/Frocole_Module.git frocole'.
