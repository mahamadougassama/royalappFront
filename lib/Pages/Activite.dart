import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Pages/Club.dart';
import 'package:college_royal/Widegt/MyDrawer.dart';
import 'package:flutter/material.dart';

class Activite extends StatefulWidget {
  SortieExtra? activite;
  Activite({super.key,
  this.activite,
  });

  @override
  State<Activite> createState() => _ActiviteState();
}

class _ActiviteState extends State<Activite> {
  List<String> sortie = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "ACTIVITES EXTRA-SCOLAIRES (Choix facultatifs)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
     drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
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
                          Icon(Icons.event_note, color: Colors.indigo),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "SORTIE TRIMESTRIELLE & FÊTE",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      
                      // DÉFILEMENT HORIZONTAL DE SÉCURITÉ POUR LES ÉCRANS ÉTROITS
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 650),
                          child: Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: sortie.contains("1er Trimestre"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              
                                              sortie.add("1er Trimestre");
                                            } else {
                                              sortie.remove("1er Trimestre");
                                            }
                                          });
                                        },
                                      ),
                                      const Expanded(
                                        child: Text(
                                          "1er Trimestre",
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: sortie.contains("2eme Trimestre"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              sortie.add("2eme Trimestre");
                                            } else {
                                              sortie.remove("2eme Trimestre");
                                            }
                                          });
                                        },
                                      ),
                                      const Expanded(
                                        child: Text(
                                          "2eme Trimestre",
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: sortie.contains("Aucun"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              sortie.add("Aucun");
                                            } else {
                                              sortie.remove("Aucun");
                                            }
                                          });
                                        },
                                      ),
                                      const Expanded(
                                        child: Text(
                                          "Aucun",
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: sortie.contains("Fête de fin d'année"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              sortie.add("Fête de fin d'année");
                                            } else {
                                              sortie.remove("Fête de fin d'année");
                                            }
                                          });
                                        },
                                      ),
                                      const Expanded(
                                        child: Text(
                                          "Fête de fin d'année",
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                    
                    widget.activite?.activite=sortie;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Club(
                          clubSortie: widget.activite!
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}