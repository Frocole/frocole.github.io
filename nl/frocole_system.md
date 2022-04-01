[en](/en/frocole_system) | [nl](/nl/frocole_system) | [sitemap](/nl/sitemap)

# Frocole Systeem

Het Frocole systeem bestaat uit een app, voor zowel iOS als Android, die studenten aspecten laat beoordelen van zowel hun groep, zichzelf en de andere individuen binnen een groep. Data van/voor deze app wordt opgeslagen met behulp van een set REST services - de Frocole Services - in een (my)SQL database.

Voor het beschikbaar stellen van informatie over Frocole en het beheer van cursussen binnen Frocole wordt een Drupal 9 [^1] installatie gebruikt. Voor het beheeraspect is een Frocole Module voor Drupal 9 ontwikkelt, die toegang heeft tot de Frocole Database en die gebruikt wordt door de Frocole Services. Via deze beheer tools kunnen cursussen aangemaakt en geconfigureerd worden en kan data worden geëxporteerd in een Microsoft Excel [^2] compatibel formaat.

![Frocole System](https://user-images.githubusercontent.com/1768983/161252485-51f02963-ed1a-435f-bd8a-c7144a88be7b.png)

# Repositories

- [Frocole App](https://github.com/Frocole/Frocole_App)
- [Frocole Web Services](https://github.com/Frocole/Frocole_Services)
- [Frocole Drupal Module](https://github.com/Frocole/Frocole_Module)

## Voetnoten:
[^1]: Drupal is een registered trademark of Dries Buytaert.
[^2]: Excel is a registered trademark of Microsoft Corporation.
