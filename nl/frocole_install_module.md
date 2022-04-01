[en](/en/frocole_install_module) | [nl](/nl/frocole_install_module) | [sitemap](/nl/sitemap)

# Installatie Frocole beheer module voor Drupal 9[^1]

De Frocole beheermodule is getest met Drupal 9.2.x maar zou compatible moeten zijn met zowel Drupal 9.3.x en Drupal 8. De Frocole beheer module voor Drupal 9 moet staan in een /modules/custom folder. De frocole.install files staan aldus in de /modules/custom/frocole folder binnen de Drupal installatie.

De installatie omvat 3 stappen:

- Download en kopieer de sources van de [beheer module](https://github.com/Frocole/Frocole_Module) in de /modules/custom/frocole folder (Hiermee komt het frocole.install bestand in de /modules/custom/frocole folder te staan) [^2].
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
    Vervang in bovenstaande de gemarkeerde stukken door de correcte waarden ( b.v. vervang 
    "<frocole_database_name>", door "frocole" ). De waarden zijn gelijk aan die in de frocole_db.ini file.

    Een alternatief is om onderstaande code toe te voegen:
```
    # If nessersary adjust the path to the frocole_db.ini file.
    $frocole = parse_ini_file($_SERVER['DOCUMENT_ROOT'] . "/../frocole_db.ini", TRUE);

    $databases['frocole']['default'] = array (
      'database' => $frocole['database']['schema'],
      'username' => $frocole['database']['username'],
      'password' => $frocole['database']['password'],
      'prefix' => '',
      'host' => $frocole['database']['host'],
      'port' => $frocole['database']['port'],
      'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
      'driver' => 'mysql',
    );
```
    Bovenstaande code leest de database connectie gegevens direct uit de frocole_db.ini.
- Zet de Frocole Module aan binnen Drupal via de beheer URL: ‘/admin/modules’.

Na activering van de module kunnen de Frocole Services beheerd worden via de link ‘/admin/frocole/index’ binnen Drupal 9. Deze url is het startpunt vanwaar de database van de Frocole Web Services te beheren is. Deze pagina bevat naast de mogelijkheid om cursussen toe te voegen, te wijzigen en te verwijderen ook de mogelijkheid voor het exporteren van groepsdata, het beheren van additionele info voor in de app en het segmenteren van de gebruikers in kleinere groepen.

Als een cursus bekeken wordt, krijgt men ook een lijst van groepen en studenten binnen deze groepen van een cursus te zien. De links met de ID’s van de groepen dienen voor de export naar CSV formaat, compatibel met Microsoft Excel® [^3].

## Links:
[Beheer via de Drupal 9 Module](frocole_beheer)

## Voetnoten:
[^1]: Drupal is a registered trademark of Dries Buytaert.
[^2]: Een alternatief voor unzippen en kopiëren is rechtstreeks git te gebruiken voor deployment vanuit de GitHub repository. Dit kan vanaf de command line, als de huidige folder /modules/custom is (binnen de Drupal 9 installatie), met het git commando: ‘git clone https://github.com/Frocole/Frocole_Module.git frocole’.
[^3]: Excel is a registered trademark of Microsoft Corporation.
