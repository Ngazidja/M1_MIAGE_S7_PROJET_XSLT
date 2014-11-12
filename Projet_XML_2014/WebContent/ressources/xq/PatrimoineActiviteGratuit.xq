module namespace proj="xml";

(:Affriche la liste des patrimoine dont les activités sont gratuites:)
declare function proj:patrimoinesWithActivitiesFree() {
  for $x in /programmeDataEdition/fichesInscription/ficheInscription
  where $x/offres/offre/gratuit=1
  order by $x/lieuNom 
  return <div>data($x/lieuNom) data($x/offres/offre/titre)</div>
};