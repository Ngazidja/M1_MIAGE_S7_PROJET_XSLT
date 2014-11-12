<html>
<body>

<h1>Journée</h1>

<ul>
{
for $x in /programmeDataEdition/fichesInscription/ficheInscription
order by $x/lieuNom
return <li class="{data($x/lieuCodePostal)}">{data($x/lieuNom)}</li>
}
</ul>

</body>
</html>