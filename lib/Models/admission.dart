
class Admission {
  int? id;

  // Élève
  String? nomEleve;
  String? dateLieuNaissance;
  String? nationnalite;
  String? classActuelle;
  String? etablissementFrequente;
  String? residance;
  String? rue;
  String? porte;

  // Père
  String? nomPere;
  String? professionPere;
  String? adresseContactPere;

  // Mère
  String? nomMere;
  String? professionMere;
  String? adresseContactMere;

  // Tuteur
  String? nomTuteur;
  String? professionTuteur;
  String? adresseContactTuteur;

  // Répétiteur
  String? nomRepititeur;
  String? professionRepetiteur;
  String? adresseContactRepitieteur;

  // Départ
  String? depart;
  String? accompagnant;

  // Projet éducatif
  String? projet;

  // Divers
  String? particularite;
  String? sanguin;
  String? medecin;

  Admission();

  // Conversion Dart vers JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nomEleve": nomEleve,
      "dateLieuNaissance": dateLieuNaissance,
      "nationnalite": nationnalite,
      "classActuelle": classActuelle,
      "etablissementFrequente": etablissementFrequente,
      "residance": residance,
      "rue": rue,
      "porte": porte,

      "nomPere": nomPere,
      "professionPere": professionPere,
      "adresseContactPere": adresseContactPere,

      "nomMere": nomMere,
      "professionMere": professionMere,
      "adresseContactMere": adresseContactMere,

      "nomTuteur": nomTuteur,
      "professionTuteur": professionTuteur,
      "adresseContactTuteur": adresseContactTuteur,

      "nomRepititeur": nomRepititeur,
      "professionRepetiteur": professionRepetiteur,
      "adresseContactRepitieteur": adresseContactRepitieteur,

      "depart": depart,
      "accompagnant": accompagnant,
      "projet": projet,

      "particularite": particularite,
      "sanguin": sanguin,
      "medecin": medecin,
    };
  }

  // Conversion JSON vers Dart
  factory Admission.fromJson(Map<String, dynamic> json) {
    Admission admission = Admission();

    admission.id = json['id'];
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

    admission.nomRepititeur = json['nomRepititeur'];
    admission.professionRepetiteur = json['professionRepetiteur'];
    admission.adresseContactRepitieteur =
        json['adresseContactRepitieteur'];

    admission.depart = json['depart'];
    admission.accompagnant = json['accompagnant'];

    admission.projet = json['projet'];
    
    admission.particularite = json['particularite'];
    admission.sanguin = json['sanguin'];
    admission.medecin = json['medecin'];
     
    return admission;
  }
}
