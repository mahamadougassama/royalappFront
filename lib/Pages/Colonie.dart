import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Pages/Cours.dart';
import 'package:flutter/material.dart';

class Colonie extends StatefulWidget {
  SortieExtra? colonie;
   Colonie({super.key,
  this.colonie
  });

  @override
  State<Colonie> createState() => _ColonieState();
}

class _ColonieState extends State<Colonie> {
  final List<String> colonie = [];
   TextEditingController autre=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "COLONIE DE VACANCES",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CARTE PRO POUR LE CONTENU
            Card(
              elevation: 3,
              shadowColor: Colors.indigo.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.card_travel, color: Colors.indigo),
                        SizedBox(width: 12),
                        Text(
                          "COLONIE DE VACANCES",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Table(
                     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                     children: [
                       TableRow(
                         children: [
                           Row(
                             children: [
                               Checkbox(
                                 value: colonie.contains("Maroc"),
                                 activeColor: Colors.indigo,
                                  onChanged:(valeur) {
                                   setState(() {
                                     if(valeur==true){
                                      colonie.add("Maroc");
                                     }else{
                                      colonie.remove("Maroc");
                                     }
                                   });
                                 },),
                               const Text("Maroc", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                             ],
                           ),
                           Row(
                             children: [
                               Checkbox(
                                 value: colonie.contains("Sénegal"),
                                 activeColor: Colors.indigo,
                                  onChanged:(valeur) {
                                   setState(() {
                                     if(valeur==true){
                                      colonie.add("Sénegal");
                                     }else{
                                      colonie.remove("Sénegal");
                                     }
                                   });
                                 },),
                               const Text("Sénegal", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                             ],
                           ),
                           Row(
                             children: [
                               Expanded(child: 
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 4),
                                 child: TextField(
                                   controller: autre,
                                   decoration: InputDecoration(
                                     hintText: "Autre",
                                     hintStyle: const TextStyle(fontSize: 12),
                                     contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(8),
                                       borderSide: BorderSide(color: Colors.grey.shade300),
                                     ),
                                     focusedBorder: const OutlineInputBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(8)),
                                       borderSide: BorderSide(color: Colors.indigo, width: 1.5),
                                     ),
                                   ),
                                 ),
                               ))
                             ],
                           ),
                           Row(
                             children: [
                               Checkbox(
                                 value: colonie.contains("Aucun"),
                                 activeColor: Colors.indigo,
                                  onChanged:(valeur) {
                                   setState(() {
                                     if(valeur==true){
                                      colonie.add("Aucun");
                                     }else{
                                      colonie.remove("Aucun");
                                     }
                                   });
                                 },),
                               const Text("Aucun", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                             ],
                           )
                         ]
                       )
                     ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // BOUTON SUIVANT PLEINE LARGEUR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  String autreText='';
                 if(colonie.isNotEmpty){
                  
                  widget.colonie?.colonie=colonie;
                 }
                 if(autre.text.isNotEmpty){
                 autreText=autre.text;
                 colonie.add(autreText);
                 widget.colonie?.colonie=colonie;
                 }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cours(
                        cours: widget.colonie,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                icon: const Icon(Icons.arrow_forward_rounded, size: 20),
                label: const Text(
                  "Suivant",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}