(:Il y a plusieurs fonction dans ce code.
Le but de ce fichier est de découpé en plusieurs fonction l'extraction des données puis de faire une fonction qui les appel toutes:)

module namespace proj="xml"; (:Pourquoi ?:)

(:Cette fonction affiche la liste des Patrimoines. On pourra accéder au site web si il est fourni bien évidemment:)
declare function proj:lieuNom_Site()
{
  let $path := doc("../xml/jep2014.xml")/programmeDataEdition/fichesInscription/ficheInscription[1]
return if (exists($path/sitesInternet/lieuSiteInternet))
then <a href="{data($path/sitesInternet/lieuSiteInternet)}"><h1>{data($path/lieuNom)}</h1></a>
else <h1>{data($path/lieuNom)}</h1>
};

(: Affiche l'adresse complete (adresse, code postale, commune et pays :)
declare function proj:adresse()
{
  let $path := doc("../xml/jep2014.xml")/programmeDataEdition/fichesInscription/ficheInscription[1]
return <p>{data($path/lieuAdresse)}<br />{data($path/lieuCodePostal)}{data(" ")}{data($path/lieuCommune)}{data(" ")}{data($path/lieuPays)}</p>
};

(:Affiche des données complémentaires: Accessibilité, région, accessible ou pas aux handicapés:)
declare function proj:infoCompl()
{
  let $path := doc("../xml/jep2014.xml")/programmeDataEdition/fichesInscription/ficheInscription[1]
  return
   <p>{if($path/lieuAcces) then <span>ACCESSIBILITE: {data($path/lieuAcces)}</span> else <span/>} {data($path/lieuRegion)}<br /> Acces total handicapes: {if(data($path/lieuAccesTotalHandicapes) = 0) then <span>NON</span> else <span>OUI</span> }<br />Acces partiel handicapes: {if(data($path/lieuAccesPartielHandicapes) = 0) then <span>NON</span> else <span>OUI</span> } </p>
};

(:Affiche la liste des activitées des différents patrimoine, en effet il peut y avoir plusieurs activités par patrimoine.:)
declare function proj:offres()
{
  for $i in doc("../xml/jep2014.xml")/programmeDataEdition/fichesInscription/ficheInscription
  return <sp>{data($i/lieuNom)}: {for $x in $i/offres/offre
  return <p><span>{data($x/dateDebut)} - {data($x/dateFin)}</span> : {data($x/titre)}<br />HORAIRES: <span>{data($x/horaires)}</span><br />GRATUIT:{if($x/gratuit = 0)then <span>NON</span> else<span>OUI</span>}<br />INSCRIPTION NECESSAIRE:{if($x/inscriptionNecessaire = 0)then <span>NON</span> else<span>OUI</span>}<br />SUR INVITATION:{if($x/surInvitation = 0)then <span>NON</span> else<span>OUI</span>}</p>}</sp>
};

(:La position des patrimoines, si elle est absente afficher Position absente:)
declare function proj:position()
{
  for $x in doc("../xml/jep2014.xml")/programmeDataEdition/fichesInscription/ficheInscription
   return if($x/lieuLatitude)
   then <p>Latitude:{data($x/lieuLatitude)}<br />Longitude:{data($x/lieuLongitude)}</p>
   else <p>Position absente</p> (: else (string("")):)
};

(:Reste à voir typeVisiteCommentee, conditions, theme/libelle, typeVisiteCircuit, lieuClasseMH, lieuInscritMH, lieuNumInsee :)

(:Appel de toutes les fonctions:)
declare function proj:appel()
{
  <body>
  proj:lieuNom_Site()
  proj:adresse()
  proj:offres()
  proj:position()
  </body>
};

