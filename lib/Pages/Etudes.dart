import 'dart:math';

import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Widegt/SortieState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Etudes extends ConsumerStatefulWidget {
  SortieExtra etudes;
  Etudes({super.key, required this.etudes});

  @override
  ConsumerState<Etudes> createState() => _EtudesState();
}

class _EtudesState extends ConsumerState<Etudes> {
  TextEditingController autreEtude=TextEditingController();
    List<String> etude = [];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Etudes Universitaire",
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
                        Icon(Icons.school, color: Colors.indigo),
                        SizedBox(width: 12),
                        Text(
                          "ETUDES UNIVERSITAIRES",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    
                    // DÉFILEMENT HORIZONTAL DE SÉCURITÉ POUR TOUS LES APPAREILS
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 700),
                        child: Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: etude.contains("Maroc"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            etude.remove("Aucun");
                                            etude.add("Maroc");
                                          } else {
                                            etude.remove("Maroc");
                                          }
                                        });
                                      },
                                    ),
                                    const Text("Maroc", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: etude.contains("Europe"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            etude.remove("Aucun");
                                            etude.add("Europe");
                                          } else {
                                            etude.remove("Europe");
                                          }
                                        });
                                      },
                                    ),
                                    const Text("Europe", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: etude.contains("Canada"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            etude.remove("Aucun");
                                            etude.add("Canada");
                                          } else {
                                            etude.remove("Canada");
                                          }
                                        });
                                      },
                                    ),
                                    const Text("Canada", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: etude.contains("USA"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            etude.remove("Aucun");
                                            etude.add("USA");
                                          } else {
                                            etude.remove("USA");
                                          }
                                        });
                                      },
                                    ),
                                    const Text("USA", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: etude.contains("Chine"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                          
                                            etude.remove("Aucun");
                                            etude.add("Chine");
                                          } else {
                                            etude.remove("Chine");
                                          }
                                        });
                                      },
                                    ),
                                    const Text("Chine", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                  child: TextField(
                                    controller: autreEtude,
                                    decoration: InputDecoration(
                                      hintText: "Autres a preciser",
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
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: etude.contains("Aucun"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            etude.clear();
                                            etude.add("Aucun");
                                          } else {
                                            etude.remove("Aucun");
                                          }
                                        });
                                      },
                                    ),
                                    const Text("Aucun", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Container(), // Cellule vide pour équilibrer la ligne du tableau
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
             SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
            List<String> listeEtudes = [...etude];

          if (autreEtude.text.trim().isNotEmpty) {
          listeEtudes.add(autreEtude.text.trim());
        }

         widget.etudes.etude = listeEtudes;

          ref.read(sortieProvider.notifier).save(widget.etudes);
          
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
                
                label: const Text(
                  "Sauvegardez",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          ],
        ),
      ),
    );
  }
}