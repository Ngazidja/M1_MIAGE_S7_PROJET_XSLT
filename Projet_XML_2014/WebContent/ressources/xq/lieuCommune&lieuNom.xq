(:Fichier test: affiche la commune et le patrimoine:)
<test1>{for $x in /programmeDataEdition/fichesInscription/ficheInscription
order by $x/lieuCommune
return <test> {data($x/lieuCommune)} : {data($x/lieuNom)} </test>}</test1>