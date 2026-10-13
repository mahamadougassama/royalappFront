class Admission {

//Eleve
String? nomEleve;
String? dateLieuNaissance;
String?nationalite;
String? classActuelle;
String? etablissementFrequente;
String? residence;
String? rue;
String? porte;
//pere
String? nomPere;
String? professionPere;
String? adresseContactPere;
//mere
String? nomMere;
String? professionMere;
String? adresseContactMere;
//Tuteur
String? nomTuteur;
String? professionTuteur;
String? adresseContactTuteur;
//repediteur
String? nomRepediteur;
String? professionRepediteur;
String? adresseContactRepediteur;
//depart;
String? depart;
String?accompagnant;
//Projet Educatif
String? projet;
//Divers
String? particularite;
String? sanguin;
String? medecin;
Admission();

Map<String,dynamic> toJson(){
  return {
    "nomEleve":nomEleve,
    "dateLieuNaissance":dateLieuNaissance,
    "nationalite":nationalite,
    "classeActuelle":classActuelle,
    "etablissamentFrequente":etablissementFrequente,
    "residance":residence,
    "rue":rue,
    "porte":porte,
    "nomPere":nomPere,
    "professionPere":professionPere,
    "adresseContactPere":adresseContactPere,
    "nomMere":nomMere,
    "professionMere":professionMere,
    "adresseConatctMere":adresseContactMere,
    "nomTuteur":nomTuteur,
    "professionTuteur":professionTuteur,
    "adresseContactTuteur":adresseContactTuteur,
    "nomRepetiteur":nomRepediteur,
    "professionRepetiteur":professionRepediteur,
    "adresseCobtactRepetiteur":adresseContactRepediteur,
    "depart":depart,
    "accompagnant":accompagnant,
    "projet":projet,
    "particularite":particularite,
    "sanguin":sanguin,
    "medecin":medecin,
  };
}
factory Admission.fromJson(Map<String, dynamic> json) {
  Admission admission = Admission();

  admission.nomEleve = json['nomEleve'];
  admission.dateLieuNaissance = json['dateLieuNaissance'];
  admission.nationalite = json['nationalite'];
  admission.classActuelle = json['classeActuelle'];
  admission.etablissementFrequente = json['etablissamentFrequente'];
  admission.residence = json['residance'];
  admission.rue = json['rue'];
  admission.porte = json['porte'];

  admission.nomPere = json['nomPere'];
  admission.professionPere = json['professionPere'];
  admission.adresseContactPere = json['adresseContactPere'];

  admission.nomMere = json['nomMere'];
  admission.professionMere = json['professionMere'];
  admission.adresseContactMere = json['adresseConatctMere'];

  admission.nomTuteur = json['nomTuteur'];
  admission.professionTuteur = json['professionTuteur'];
  admission.adresseContactTuteur = json['adresseContactTuteur'];

  admission.nomRepediteur = json['nomRepetiteur'];
  admission.professionRepediteur = json['professionRepetiteur'];
  admission.adresseContactRepediteur = json['adresseCobtactRepetiteur'];

  admission.depart = json['depart'];
  admission.accompagnant = json['accompagnant'];

  admission.projet = json['projet'];

  admission.particularite = json['particularite'];
  admission.sanguin = json['sanguin'];
  admission.medecin = json['medecin'];

  return admission;
}




}