# Frocole Systeem

Het Frocole systeem bestaat uit een tweetal Apps, voor iOS respectievelijk Android, die de studenten aspecten laat beoordelen van zowel hun groep alsmede de individuen binnen hun groep. Data van/voor deze Apps wordt opgeslagen m.b.v. de Frocole Services in een (my)SQL database.

Voor het beschikbaarstellen van informatie over Frocole en het beheer van cursussen binnen Frocole wordt een Drupal 9 installatie gebruikt. Voor het beheeraspect is er een Frocole Module voor Durpal 9 die toegang heeft tot de Frocole Database die gebruikt wordt door de Frocole Services. Hiermee kunnen cursussen worden aangemaakt en geconfigureerd worden en kan data worden geexporteerd in een Microsoft Excel compatibel formaat.

![image](https://user-images.githubusercontent.com/1768983/158581038-e14b9e59-9b0d-4d1f-9627-fb80f63078b7.png)

# Compileren van de Frocole App

Om de Frocole_App te compileren voro iOS en Android is een installatie van Unity3D vereist, bij voorkeur een LTS versie als 2020.3.3f1 of 2020.3.16f1.

Aan het Frocole_App project moet in de Assets/Scripts folder een file worden toegevoegd met daarin de salt string voor het hashen van wachtwoorden en het aantal hashing iteraties (cost). Deze file moet de volgende code bevatten waarbij de string waarde '' en de integer aangepast dient te worden.

```
public class EncryptionKey
{
   public static string Seed = "<salt>";
   public static int Cost = <cost>;
}
```

Er worden aldus geen wachtwoorden leesbaar in de database opgeslagen of verzonden door de app naar de server.

Als initiele scene moet '00_Persistent Data' gekozen worden waarna de app te testen is binnen de Unity3D ontwikkelomgeving en daarbuiten na een platform specifieke compilatie naar iOS en/of Android.

# Database credentials voor de Frocole services.

De connectie met de database die gebruikt wordt door de Frocole services kunnen in de config.inc gespecificeerd worden.

De credentials en connectie details kunnen of hard gecodeerd worden in deze file of, veiliger, in bv een ini file (b.v. frocole_db.ini) buiten de webroot worden opgeslagen.

```
[database]
host = mysql host 
port = mysql port
schema = naam Frocole Services database
username = mysql username
password = mysql password
```

In de config.inc can deze file orden ingelezen door het statement:

```
$db = $settings['database']['schema'];  
```

en de Frocole Services database connectie kan dan gecreerd worden door:

```
$conn = new mysqli(
                     $settings['database']['host'], 
                     $settings['database']['username'], 
                     $settings['database']['password'], 
                     $db, 
                     $settings['database']['port']
   ); // ENTER Credentials and other MySql info here
```   
   
# Database creatie.

Om de tabellen in de Frocle mysql database aan te maken is het voldoende om het mysql script frocole.sql uit te voeren in mysql of mariadb. Dit script creeert een utf8mb4 database met de naam 'frocole'.

Dit kan met een commando:

```
mysql –u{mysql username} –p{mysql password} –h{mysql host} –P{mysql port} frocole < {*.sql bestandnaam}
```

Let op: indien een andere database naam dan 'frocole' gewenst is, moet dit zowel in het bovenstaande commando als in het sql bestand aangepast worden (zie de regels 20 tot 24).

De schema van de database ziet er als volgt uit:

![image](https://user-images.githubusercontent.com/1768983/158581828-458b9e97-6100-4049-a242-f5051a3e11aa.png)

Let op: Relaties tussen de tabellen worden door de app en de services gedefinieerd, er worden dus geen SQL relaties in de database gebruikt.

# Frocole module

De Frocole module voor Drupal 9 moet staan in een /modules/custom folder. De frocole.install files staat aldus in de /modules/custom/frocole folder.

Om deze module te laten werken is het nodig om de database credentials van de Frocole Services Database op te nemen in de Drupal /sites/default/settings.php door toevoeging de volgende code, waarbij de waarden tussen accolades aangepast moeten worden.

```
$databases['frocole']['default'] = array (
  'database' => 'frocole',
  'username' => '{mysql username}',
  'password' => '{mysql password}',
  'prefix' => '',
  'host' => '{mysql host}',
  'port' => '{mysql port}',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);
```

Na activering van de module kunnen de Frocole Services beheerd worden via de /admin/frocole/index en /admin/frocole/info links binnen Drupal 9.
