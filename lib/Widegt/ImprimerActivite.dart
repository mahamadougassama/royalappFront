import 'package:college_royal/Models/SortieExtra.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ImprimerActivite {
Future<void>ActiviteImprimer(SortieExtra sortieExtra)async{
  final pdf=pw.Document();
 pdf.addPage(
pw.Page(build: (context){
  return pw.Column(
    children: [
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

    ]
  ),
  pw.SizedBox(height: 20),
  pw.Table(
  border: pw.TableBorder.all(),
  children: [
    pw.TableRow(children: [
      pw.Padding(padding: pw.EdgeInsets.all(10),
      child: pw.Center(
        child: pw.Text("ACTIVITES EXTRAT-SCOLAIRES")
      )
      )
    ])
  ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text(" Prenom et Nom de L'élève : ${sortieExtra.admission?.nomEleve ?? 'Non Identifier'}")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("Classe : ${sortieExtra.admission?.classActuelle ?? 'Non Identifier'}")
        )
         )
      ]),

    ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("SORTIE TRIMESTRIELLE &FÊTE ")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("${sortieExtra.activite} ")
        )
         )
      ]),

    ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("CLUBS ")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("${sortieExtra.club} ")
        )
         )
      ]),
      
    ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("COLONIE DE VACANCES ")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("${sortieExtra.colonie} ")
        )
         )
      ]),
      
    ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("COURS A DIMICILE ")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("${sortieExtra.cours} ")
        )
         )
      ]),
      
    ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("CONCOURS & COMPETITIONS ")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("${sortieExtra.concours} ")
        )
         )
      ]),
      
    ]
  ),
  pw.SizedBox(height: 10),
  pw.Table(
    border: pw.TableBorder.all(),
    children: [
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("EUDES UNIVERSITAIRES ")
        )
         )
      ]),
      pw.TableRow(children: [
        pw.Padding(padding:pw.EdgeInsets.all(10),
        child: pw.Center(
          child: pw.Text("${sortieExtra.etude} ")
        )
         )
      ]),
      
    ]
  )
  
  ]
  
    );
}
),
 );
 await Printing.layoutPdf(onLayout: (format)async=>pdf.save());
}


}