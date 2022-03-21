# Beheer en gebruik

Frocole is te beheren via de /admin/frocole/index URL [^1].
Er zijn via de Frocole beheer module een aantal zaken te beheren.

1. Cursussen,
2. (Extra) Informatie om te tonen in de app’s info pagina,
3. Segmenten.

Gebruikers en docent accounts moeten met de app worden aangemaakt. Docenten (indien toegewezen als docent aan een cursus), kan binnen de app groepen definiëren, studenten toevoegen aan een groep, deadlines zetten en parameters ingeven voor de pedagogical agent.
Studenten kunnen zich aanmelden voor een cursus en indien toegewezen aan een groep binnen die cursus de app gebruiken om de diverse vormen van feedback geven.

Op deze beheerpagina’s is het mogelijk om cursussen te definiëren, aan te passen en te verwijderen [^2].

![image](https://user-images.githubusercontent.com/1768983/159274543-fbb82873-5a37-42e2-a8ce-351a23250a94.png)

Daarnaast kan er additionele informatie gedefinieerd worden die in de app getoond wordt. Denk hierbij aan b.v. onderhoudstijdstippen [^2].
 
![image](https://user-images.githubusercontent.com/1768983/159274579-ce41eafc-84ad-41ab-b802-88603d512489.png)

Tenslotte kunnen er, om de schaalbaarheid van Frocole te vergroten, zogenaamde segmenten gedefinieerd worden. Door cursussen en gebruikers accounts te koppelen met een segment ontstaat als het ware een privé Frocole server die afgeschermd is van andere segmenten. Het is b.v. voor studenten binnen een segment niet mogelijk om met hetzelfde account zich aan te melden voor cursussen uit een ander segment [^2].

![image](https://user-images.githubusercontent.com/1768983/159274598-2aa0b368-3882-48e3-928e-da6d1bb0abef.png)

Data kan per groep worden geëxporteerd worden in ‘comma separated values’ (*.csv) formaat compatibel met Microsoft Excel ™ formaat door een cursus te bekijken (View) en te klikken op de link van de gewenste groep.

![image](https://user-images.githubusercontent.com/1768983/159274637-44916274-60b4-4b33-8098-4895cfb62ac1.png)

[^1]: Voor toegang tot de beheerpagina's moet een Drupal gebruiker de rol 'Frocole beheerder' hebben.
[^2]: Let er bij verwijderen van segmenten, cursussen en informatie teksten op dat deze niet meer in gebruik zijn. Het verwijderen van een cursus verwijderd ook alle groepen, studenten en door hun gegeven feedback. Het kan daarom beter zijn om een cursus te deactiveren, waardoor deze onzichtbaar wordt voor gebruikers van de apps.