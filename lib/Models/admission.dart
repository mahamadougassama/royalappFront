class Admission {
int? id;
//Eleve
String? nomEleve;
String? dateLieuNaissance;
String? nationnalite;
String? classActuelle;
String? etablissementFrequente;
String? residance;
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
String? nomRepititeur;
String? professionRepetiteur;
String? adresseContactRepitieteur;
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
    "id":id,
    "nomEleve":nomEleve,
    "dateLieuNaissance":dateLieuNaissance,
    "nationnalite":nationnalite,
    "classActuelle":classActuelle,
    "etablissementFrequente":etablissementFrequente,
    "residance":residance,
    "rue":rue,
    "porte":porte,
    "nomPere":nomPere,
    "professionPere":professionPere,
    "adresseContactPere":adresseContactPere,
    "nomMere":nomMere,
    "professionMere":professionMere,
    "adresseContactMere":adresseContactMere,
    "nomTuteur":nomTuteur,
    "professionTuteur":professionTuteur,
    "adresseContactTuteur":adresseContactTuteur,
    "nomRepititeur":nomRepititeur,
    "professionRepetiteur":professionRepetiteur,
    "adresseContactRepitieteur":adresseContactRepitieteur,
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
  admission.id=json['id'];
  admission.nomEleve = json['nomEleve'];
  admission.dateLieuNaissance = json['dateLieuNaissance'];
  admission.nationnalite = json['nationnalite'];
  admission.classActuelle = json['classActuelle'];
  admission.etablissementFrequente = json['etablissementFrequente'];
  admission.residance = json['residance'];
  admission.rue = json['rue'];
  admission.porte = json['porte'];

  admission.nomPere = json['nomPere'];
  admission.professionPere = json['professionPere'];
  admission.adresseContactPere = json['adresseContactPere'];

  admission.nomMere = json['nomMere'];
  admission.professionMere = json['professionMere'];
  admission.adresseContactMere = json['adresseContactMere'];

  admission.nomTuteur = json['nomTuteur'];
  admission.professionTuteur = json['professionTuteur'];
  admission.adresseContactTuteur = json['adresseContactTuteur'];

  admission.nomRepititeur = json['nomRepetiteur'];
  admission.professionRepetiteur = json['professionRepetiteur'];
  admission.adresseContactRepitieteur = json['adresseCobtactRepetiteur'];

  admission.depart = json['depart'];
  admission.accompagnant = json['accompagnant'];

  admission.projet = json['projet'];

  admission.particularite = json['particularite'];
  admission.sanguin = json['sanguin'];
  admission.medecin = json['medecin'];

  return admission;
}




}