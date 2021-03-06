[en](/en/frocole_compile_app) | [nl](/nl/frocole_compile_app) | [sitemap](/nl/sitemap)

# Compileren van de Frocole App

Om de [Frocole_App](https://github.com/Frocole/Frocole_App) te compileren voor iOS en Android is een installatie van Unity3D vereist, bij voorkeur een LTS[^1] versie als 2020.3.3f1 of 2020.3.16f1.

Aan het [Frocole_App](https://github.com/Frocole/Frocole_App) project moet in de Assets/Scripts folder een file worden toegevoegd met daarin de salt string voor het hashen van wachtwoorden en het aantal hashing iteraties (cost). Deze file moet de volgende EncryptionKey class bevatten waarbij de Seed string en de Costs integer waarden aangepast dienen te worden.

```
public class EncryptionKey
{
   public static string Seed = "<salt>";
   public static int Cost = <cost>;
}
```

Er worden geen leesbare wachtwoorden in de database opgeslagen of verzonden door de app naar de server. Alle wachtwoorden zijn salted en worden gehashed opgeslagen.

Als initiële scene moet ‘00_Persistent Data’ gekozen worden waarna de app te testen is binnen de Unity3D ontwikkelomgeving en daarbuiten na een platform specifieke compilatie naar iOS en/of Android. De app kan ook gecompileerd worden op Desktop systemen als Microsoft Windows of direct in de Unity3D IDE.

## Voetnoten:

[^1]:LTS : Long Term Support.
