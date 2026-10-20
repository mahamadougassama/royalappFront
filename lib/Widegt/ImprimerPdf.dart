
import 'package:college_royal/Models/admission.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ImprimerPdf {
  Future<void> imprimerAdmission(Admission admission) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Partie gauche : ministère et gouvernorat
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

                // Partie centrale : République du Mali
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

                // Partie droite : emplacement de la photo
                pw.Container(
                  height: 110,
                  width: 85,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(),
                  ),
                  child: pw.Center(
                    child: pw.Text("PHOTO"),
                  ),
                ),
              ],
            ),
           pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.Center(
                      child: pw.Text(
                        "Fiche d'admission 2026-2027",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]),
              ],
            ),

            pw.SizedBox(height: 20),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.Center(
                      child: pw.Text("IDENTITE DE L'ELEVE"),
                    ),
                  )
                ]),
                pw.TableRow(children: [
                  pw.Text("Prénom et Nom : ${admission.nomEleve ?? 'Non Identifier'} "),
                ]),
                pw.TableRow(children: [
                  pw.Text("Date et Lieu de Naissance : ${admission.dateLieuNaissance??'Non Identifier'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Nationnalité : ${admission.nationnalite ??'Non Identifier'}"),
                ]),
                pw.TableRow(children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Classe actuelle : ${admission.classActuelle??'Non Identifier'}"),
                      pw.Text("L'Etablissement fréquenté : ${admission.etablissementFrequente ??'Non Identifier'}"),
                    ],
                  )
                ]),
                pw.TableRow(children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Résidence : ${admission.residance ?? 'Non Identifier'}"),
                      pw.Text("Rue : ${admission.rue ??'Non Identifier'}"),
                      pw.Text("Porte : ${admission.porte??'Non Identifer'}")
                    ],
                  )
                ]),
              ],
            ),

            pw.SizedBox(height: 20),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(12),
                    child: pw.Center(
                      child: pw.Text(
                        "IDENTITE DES PARENTS",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]),
                pw.TableRow(children: [
                  pw.Text("Père "),
                  pw.Text("Mère")
                ]),
                pw.TableRow(children: [
                  pw.Text("Prénom et Nom : ${admission.nomPere??'Non Identifer'}"),
                  pw.Text("Prénom et Nom : ${admission.nomMere??'Non Identifer'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Profession : ${admission.professionPere??'Non Identifer'}"),
                  pw.Text("Profesion : ${admission.professionMere??'Non Identifer'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Adresse et Contact : ${admission.adresseContactPere??'Non Identifer'}"),
                  pw.Text("Adresse et Contact : ${admission.adresseContactMere??'Non Identifer'}" ),
                ]),
              ],
            ),

            pw.SizedBox(height: 20),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.Center(
                      child: pw.Text("IDENTITE DES ENCADRANTS"),
                    ),
                  )
                ]),
              ],
            ),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Text("Tuteur Accompagnant"),
                  pw.Text("Répétiteur"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Prenom et Nom : ${admission.nomTuteur??'Non Identifer'}"),
                  pw.Text("Prenom et Nom : ${admission.nomRepititeur??'Non Identifer'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Profession : ${admission.professionTuteur??'Non Identifer'}"),
                  pw.Text("Profession : ${admission.professionRepetiteur??'Non Identifer'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Contacts : ${admission.adresseContactTuteur??'Non Identifer'}"),
                  pw.Text("Contacts : ${admission.adresseContactRepitieteur??'Non Identifer'}"),
                ])
              ],
            ),

            pw.SizedBox(height: 20),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.Center(
                      child: pw.Text(
                        "Départ de l'élève a la descente de l'école",
                      ),
                    ),
                  )
                ]),
                pw.TableRow(children: [
                  pw.Text("Partir à la maison : ${admission.depart??'Non Identifer'}"),
                ])
              ],
            ),

            pw.SizedBox(height: 20),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.Center(
                      child: pw.Text("Projet éducatif"),
                    ),
                  )
                ]),
                pw.TableRow(children: [
                  pw.Text("Projet : ${admission.projet??'Non Identifer'}"),
                ])
              ],
            ),

            pw.SizedBox(height: 20),

            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.Center(
                      child: pw.Text("DIVERS"),
                    ),
                  )
                ]),
                pw.TableRow(children: [
                  pw.Text("La Particularite de l'Eleve : ${admission.particularite??'Non Identifer'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("Le groupe snaguin de l'élève : ${admission.sanguin??'Non Identifer'}"),
                ]),
                pw.TableRow(children: [
                  pw.Text("L'Adresse et le Contact du Medecin :${admission.sanguin??'Non Identifer'}"),
                ])
              ],
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}
