# Frocole Drupal 9 Module

# Setup

De [Frocole Module](https://github.com/Frocole/Frocole_Module) voor Drupal 9 moet staan in een /modules/custom folder. De frocole.install files staat aldus in de /modules/custom/frocole folder.

Om deze module te laten werken is het nodig om de database credentials van de Frocole Services Database op te nemen in de Drupal /sites/default/settings.php door toevoeging de volgende code, waarbij de waarden tussen accolades aangepast moeten worden.

Example:

```
$databases["frocole"]["default"] = array (
"database" => "frocole",
"username" => "<mysql user>",
"password" => "<mysql pw>",
"prefix" => "",
"host" => "<mysql hostname>",
"port" => "3306",
"namespace" => "Drupal\\Core\\Database\\Driver\\mysql",
"driver" => "mysql",
);
```

# Use

Na activering van de module kunnen de Frocole Services beheerd worden via de /admin/frocole/index link binnen Drupal 9. Deze url is het startpunt vanwaar de database van de Frocole Web Services te beheren is. Deze pagina bevat naast de mogelijkeid om cursussen toe te voegen, te wijzigen en te verwijderen ook het exporteren van groepsdata, het beheren van additionele info voor in de app en het segmenteren van de gebruikers in kleinere groepen.

Als een cursus bekeken wordt, dan krijgt men ook een lijst van groepen en studenten binnen deze groepen van een cursus te zien. De ID's van de groepen dienen voor de export naar CSV formaat, compatibel met Microsoft Excel®.

# Opmerkingen

- De frocole database bevat geen SQL relaties of restricties. 
- Het verwijderen van een cursus verwijderd echter wel de bijbehorende groepen, gebruikers en gegeven feedback. 
- Docenten echter worden niet verwijderd bij het verwijderen van een cursus omdat zij in een ander cursus actief zou kunnen zijn als docent of student.
- Het is dus veiliger om afgelopen cursussen op inactief te zetten zodat ze niet meer zichtbaar zijn in de app.
- Het verwijderen van in gebruik zijnde segmenten zal problemen opleveren zowel de cursussen als de gebruikers binnen dat sergment.
- Bij het invoeren van de 3-10 performance lebals moeten deze gescheiden worden met 'forward slashes' (e.g. "/").
