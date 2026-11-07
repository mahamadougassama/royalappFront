
import 'package:college_royal/Models/admission.dart';
import 'package:college_royal/Models/SortieExtra.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
class ImprimerPdf {

  // ==================================================
  // FONCTION PRINCIPALE : GENERER LES DEUX PAGES
  // ==================================================

  Future<void> imprimerAdmissionEtActivite(
    Admission admission,
    SortieExtra sortieExtra,
  ) async {

    final pdf = pw.Document();

    // PAGE 1 : RECTO - FICHE D'ADMISSION COMPLETE
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return pw.FittedBox(
            fit: pw.BoxFit.scaleDown,
            child: pw.SizedBox(
              width: PdfPageFormat.a4.width - 40,
              child: construireAdmission(admission),
            ),
          );
        },
      ),
    );

    // PAGE 2 : VERSO - ACTIVITES EXTRASCOLAIRES
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return pw.SizedBox(
            width: PdfPageFormat.a4.width - 40,
            child: construireActivite(sortieExtra),
          );
        },
      ),
    );

    // LANCER L'IMPRESSION
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }

  // ==================================================
  // EN-TETE
  // ==================================================

  pw.Widget construireEntete({bool avecPhoto = false}) {

    return pw.SizedBox(
      width: PdfPageFormat.a4.width - 40,
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [

          pw.Expanded(
            flex: 3,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("MINISTERE DE L'EDUCATION NATIONALE"),
                pw.Text("*************************"),
                pw.Text("GOUVERNORAT DU DISTRICT DE BAMAKO"),
                pw.Text("*************************"),
                pw.Text("Académie d'enseignement :"),
                pw.Text("Rive Droite de Bamako"),
              ],
            ),
          ),

          pw.Expanded(
            flex: 2,
            child: pw.Column(
              children: [
                pw.Text("REPUBLIQUE DU MALI"),
                pw.Text("******************"),
                pw.Text("Un Peuple - Un But - Une Foi"),
              ],
            ),
          ),

          if (avecPhoto)
            pw.Container(
              height: 90,
              width: 70,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(),
              ),
              child: pw.Center(
                child: pw.Text("PHOTO"),
              ),
            ),
        ],
      ),
    );
  }

  // ==================================================
  // TITRES DES TABLEAUX
  // ==================================================

  pw.Widget titreTableau(String titre) {

    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(8),
      alignment: pw.Alignment.center,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(),
      ),
      child: pw.Text(
        titre,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }

  // ==================================================
  // CREER UNE LIGNE
  // ==================================================

  pw.Widget ligne(String texte) {

    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(7),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(),
      ),
      child: pw.Text(texte),
    );
  }

  // ==================================================
  // PAGE 1 : FICHE D'ADMISSION
  // ==================================================

  pw.Widget construireAdmission(Admission admission) {

    return pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [

        // EN-TETE AVEC PHOTO
        construireEntete(avecPhoto: true),

        pw.SizedBox(height: 12),

        titreTableau("FICHE D'ADMISSION 2026-2027"),

        pw.SizedBox(height: 10),

        // IDENTITE DE L'ELEVE
        titreTableau("IDENTITE DE L'ELEVE"),

        ligne(
          "Prenom et Nom : ${admission.nomEleve ?? 'Non Identifier'}",
        ),

        ligne(
          "Date et Lieu de Naissance : ${admission.dateLieuNaissance ?? 'Non Identifier'}",
        ),

        ligne(
          "Nationalite : ${admission.nationnalite ?? 'Non Identifier'}",
        ),

        ligne(
          "Classe actuelle : ${admission.classActuelle ?? 'Non Identifier'}",
        ),

        ligne(
          "Etablissement frequente : ${admission.etablissementFrequente ?? 'Non Identifier'}",
        ),

        ligne(
          "Residence : ${admission.residance ?? 'Non Identifier'}",
        ),

        pw.Row(
          children: [

            pw.Expanded(
              child: ligne(
                "Rue : ${admission.rue ?? 'Non Identifier'}",
              ),
            ),

            pw.Expanded(
              child: ligne(
                "Porte : ${admission.porte ?? 'Non Identifier'}",
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 8),

        // IDENTITE DES PARENTS
        titreTableau("IDENTITE DES PARENTS"),

        pw.Table(
          border: pw.TableBorder.all(),
          children: [

            pw.TableRow(
              children: [
                cellule("PERE"),
                cellule("MERE"),
              ],
            ),

            pw.TableRow(
              children: [
                cellule(
                  "Nom : ${admission.nomPere ?? 'Non Identifier'}",
                ),
                cellule(
                  "Nom : ${admission.nomMere ?? 'Non Identifier'}",
                ),
              ],
            ),

            pw.TableRow(
              children: [
                cellule(
                  "Profession : ${admission.professionPere ?? 'Non Identifier'}",
                ),
                cellule(
                  "Profession : ${admission.professionMere ?? 'Non Identifier'}",
                ),
              ],
            ),

            pw.TableRow(
              children: [
                cellule(
                  "Adresse et Contact : ${admission.adresseContactPere ?? 'Non Identifier'}",
                ),
                cellule(
                  "Adresse et Contact : ${admission.adresseContactMere ?? 'Non Identifier'}",
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 8),

        // IDENTITE DES ENCADRANTS
        titreTableau("IDENTITE DES ENCADRANTS"),

        pw.Table(
          border: pw.TableBorder.all(),
          children: [

            pw.TableRow(
              children: [
                cellule("TUTEUR ACCOMPAGNANT"),
                cellule("REPETITEUR"),
              ],
            ),

            pw.TableRow(
              children: [
                cellule(
                  "Nom : ${admission.nomTuteur ?? 'Non Identifier'}",
                ),
                cellule(
                  "Nom : ${admission.nomRepititeur ?? 'Non Identifier'}",
                ),
              ],
            ),

            pw.TableRow(
              children: [
                cellule(
                  "Profession : ${admission.professionTuteur ?? 'Non Identifier'}",
                ),
                cellule(
                  "Profession : ${admission.professionRepetiteur ?? 'Non Identifier'}",
                ),
              ],
            ),

            pw.TableRow(
              children: [
                cellule(
                  "Contacts : ${admission.adresseContactTuteur ?? 'Non Identifier'}",
                ),
                cellule(
                  "Contacts : ${admission.adresseContactRepitieteur ?? 'Non Identifier'}",
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 8),

        // DEPART DE L'ELEVE
        titreTableau("DEPART DE L'ELEVE A LA DESCENTE"),

        ligne(
          "Depart a la maison : ${
            admission.depart == "seul"
                ? "Seul"
                : admission.accompagnant != null &&
                        admission.accompagnant!.trim().isNotEmpty
                    ? "Avec ${admission.accompagnant}"
                    : "Non Identifier"
          }",
        ),

        pw.SizedBox(height: 8),

        // PROJET EDUCATIF
        titreTableau("PROJET EDUCATIF"),

        ligne(
          "Projet : ${admission.projet ?? 'Non Identifier'}",
        ),

        pw.SizedBox(height: 8),

        // DIVERS
        titreTableau("DIVERS"),

        ligne(
          "Particularite de l'eleve : ${admission.particularite ?? 'Non Identifier'}",
        ),

        ligne(
          "Groupe sanguin : ${admission.sanguin ?? 'Non Identifier'}",
        ),

        ligne(
          "Adresse et Contact du medecin : ${admission.medecin ?? 'Non Identifier'}",
        ),
      ],
    );
  }

  // ==================================================
  // PAGE 2 : FICHE DES ACTIVITES EXTRASCOLAIRES
  // ==================================================

  pw.Widget construireActivite(SortieExtra sortieExtra) {

    return pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [

        // EN-TETE SANS PHOTO
        construireEntete(avecPhoto: false),

        pw.SizedBox(height: 20),

        titreTableau("ACTIVITES EXTRASCOLAIRES"),

        pw.SizedBox(height: 10),

        // SORTIES TRIMESTRIELLES
        titreTableau("SORTIE TRIMESTRIELLE ET FETE"),

        ligne(
          "${sortieExtra.activite ?? []}",
        ),

        pw.SizedBox(height: 10),

        // CLUBS
        titreTableau("CLUBS"),

        ligne(
          "${sortieExtra.club ?? []}",
        ),

        pw.SizedBox(height: 10),

        // COLONIES
        titreTableau("COLONIE DE VACANCES"),

        ligne(
          "${sortieExtra.colonie ?? []}",
        ),

        pw.SizedBox(height: 10),

        // COURS A DOMICILE
        titreTableau("COURS A DOMICILE"),

        ligne(
          "${sortieExtra.cours ?? []}",
        ),

        pw.SizedBox(height: 10),

        // CONCOURS
       
      ],
    );
  }

  // ==================================================
  // CELLULE UTILISEE DANS LES TABLEAUX
  // ==================================================

  pw.Widget cellule(String texte) {

    return pw.Padding(
      padding: const pw.EdgeInsets.all(7),
      child: pw.Text(texte),
    );
  }
}
