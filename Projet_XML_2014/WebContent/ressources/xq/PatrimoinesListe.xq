(:Retourne la liste des patrimoine et ke lien vers le site si il existe dans la base de données:)

for $x in /programmeDataEdition/fichesInscription/ficheInscription

return if ($x/sitesInternet/lieuSiteInternet)
then <a href="{data($x/sitesInternet/lieuSiteInternet)}"><h1>{data($x/lieuNom)}</h1></a>
else <h1>{data($x/lieuNom)}</h1>

