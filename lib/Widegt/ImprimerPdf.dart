import 'package:college_royal/Models/admission.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ImprimerPdf {

  final Admission admission;

  ImprimerPdf(this.admission);

  Future<void> imprimer() async {

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [

              // TITRE
              pw.Text(
                "Fiche d'Admission",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 20),

              // =========================
              // IDENTITE DE L'ELEVE
              // =========================

              pw.Text(
                "IDENTITE DE L'ELEVE",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 10),

              pw.Text("Prenom et Nom : ${admission.nomEleve}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Date et lieu de naissance : ${admission.dateLieuNaissance}",
              ),
              pw.SizedBox(height: 6),

              pw.Text("Nationalite : ${admission.nationalite}"),
              pw.SizedBox(height: 6),

              pw.Text("Classe actuelle : ${admission.classActuelle}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Etablissement frequente : ${admission.etablissementFrequente}",
              ),
              pw.SizedBox(height: 6),

              pw.Text("Residence : ${admission.residence}"),
              pw.SizedBox(height: 6),

              pw.Text("Rue : ${admission.rue}"),
              pw.SizedBox(height: 6),

              pw.Text("Porte : ${admission.porte}"),

              pw.SizedBox(height: 20),

              // =========================
              // IDENTITE DES PARENTS
              // =========================

              pw.Text(
                "IDENTITE DES PARENTS",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 10),

              // PERE
              pw.Text(
                "PERE",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 6),

              pw.Text("Nom : ${admission.nomPere}"),
              pw.SizedBox(height: 6),

              pw.Text("Profession : ${admission.professionPere}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Adresse / Contact : ${admission.adresseContactPere}",
              ),

              pw.SizedBox(height: 12),

              // MERE
              pw.Text(
                "MERE",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 6),

              pw.Text("Nom : ${admission.nomMere}"),
              pw.SizedBox(height: 6),

              pw.Text("Profession : ${admission.professionMere}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Adresse / Contact : ${admission.adresseContactMere}",
              ),

              pw.SizedBox(height: 20),

              // =========================
              // IDENTITE DES ENCADRANTS
              // =========================

              pw.Text(
                "IDENTITE DES ENCADRANTS",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 10),

              // TUTEUR
              pw.Text(
                "TUTEUR",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 6),

              pw.Text("Nom : ${admission.nomTuteur}"),
              pw.SizedBox(height: 6),

              pw.Text("Profession : ${admission.professionTuteur}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Adresse / Contact : ${admission.adresseContactTuteur}",
              ),

              pw.SizedBox(height: 12),

              // REPETITEUR
              pw.Text(
                "REPETITEUR",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 6),

              pw.Text("Nom : ${admission.nomRepediteur}"),
              pw.SizedBox(height: 6),

              pw.Text("Profession : ${admission.professionRepediteur}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Adresse / Contact : ${admission.adresseContactRepediteur}",
              ),

              pw.SizedBox(height: 20),

              // =========================
              // INFORMATIONS COMPLEMENTAIRES
              // =========================

              pw.Text(
                "INFORMATIONS COMPLEMENTAIRES",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 10),

              pw.Text("Depart : ${admission.depart}"),
              pw.SizedBox(height: 6),

              pw.Text("Accompagnant : ${admission.accompagnant}"),
              pw.SizedBox(height: 6),

              pw.Text("Projet educatif : ${admission.projet}"),
              pw.SizedBox(height: 6),

              pw.Text(
                "Particularite de l'eleve : ${admission.particularite}",
              ),
              pw.SizedBox(height: 6),

              pw.Text(
                "Groupe sanguin : ${admission.sanguin}",
              ),
              pw.SizedBox(height: 6),

              pw.Text(
                "Medecin traitant : ${admission.medecin}",
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) {
        return pdf.save();
      },
    );
  }
}