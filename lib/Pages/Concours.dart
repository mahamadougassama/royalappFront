import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Pages/Etudes.dart';
import 'package:flutter/material.dart';

class Concours extends StatefulWidget {
  SortieExtra? concours;
  Concours({super.key, this.concours});

  @override
  State<Concours> createState() => _ConcoursState();
}

class _ConcoursState extends State<Concours> {
  List<String> concours = [];
  TextEditingController autreConcours = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "CONCOURS & COMPETITIONS",
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
            // CARTE PRO POUR ENGLOBER LE TABLEAU
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
                        Icon(Icons.emoji_events, color: Colors.indigo),
                        SizedBox(width: 12),
                        Text(
                          "CONCOURS & COMPETITIONS",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    
                    // DÉFILEMENT HORIZONTAL POUR ADAPTER À TOUS LES TÉLÉPHONES
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 800),
                        child: Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          border: TableBorder(
                            horizontalInside: BorderSide(color: Colors.grey.shade200, width: 1),
                          ),
                          columnWidths: const {
                            0: FlexColumnWidth(2.5),
                            1: FlexColumnWidth(1.5),
                            2: FlexColumnWidth(2.5),
                          },
                          children: [
                            // En-têtes du tableau
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("Intitulé", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 14)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("Lieu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 14)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("Discipline", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 14)),
                                ),
                              ],
                            ),
                            
                            // Ligne 1 : Huawei
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("Huawei ICT Competition 2027"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("Huawei ICT Competition 2027");
                                          } else {
                                            concours.remove("Huawei ICT Competition 2027");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("Huawei ICT Competition 2027", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Shenzhen/Chine", style: TextStyle(fontSize: 13)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Technologie de l'information et de la Communication", style: TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),

                            // Ligne 2 : Robotique
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("Championnat du Monde de Robotique"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("CHampionnat du Monde Robotique");
                                          } else {
                                            concours.remove("Championnat du Monde Robotique");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("Championnat du Monde de Robotique", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Fance", style: TextStyle(fontSize: 13)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Robotique", style: TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),

                            // Ligne 3 : IA
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("L'olympiade Internationale d'intelligente Artificielle"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("L'olympiade Internationale d'Intellignec Artificielle");
                                          } else {
                                            concours.remove("L'olympiade Internationale d'Intelligence Artificielle");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("L'olympiade Internationale d'intelligente Artificielle", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Abou Dhabi Emirats Arabe Unis", style: TextStyle(fontSize: 13)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Intelligence Artificielle", style: TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),

                            // Ligne 4 : Maths
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("Olympiade Internationale Mathematique"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("Olympiade Internationale Mathematique");
                                          } else {
                                            concours.remove("Olympiade Internationale Mathematique");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("Olympiade Internationale Mathematique", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Shangai/Chine", style: TextStyle(fontSize: 13)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Mathématiques", style: TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),

                            // Ligne 5 : Art et Culture
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("CREATE ART ET CULTURE"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("CREATE ART ET CULTURE");
                                          } else {
                                            concours.remove("CREATE ART ET CULTURE");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("CREATE ART ET CULTURE", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Maroc", style: TextStyle(fontSize: 13)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("ART ET CULTURE", style: TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),

                            // Ligne 6 : Calcul mental
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("World Cup en Calcul mental"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("World Cup en Calcul mental");
                                          } else {
                                            concours.remove("World Cup en Clacul mental");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("World Cup en Calcul mental", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Allemagne", style: TextStyle(fontSize: 13)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Science Cognitives", style: TextStyle(fontSize: 13)),
                                ),
                              ],
                            ),

                            // Ligne 7 : Autre à préciser
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: autreConcours,
                                    decoration: InputDecoration(
                                      hintText: "Autre a Préciser",
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
                                const SizedBox(),
                                const SizedBox(),
                              ],
                            ),

                            // Ligne 8 : Aucun
                            TableRow(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: concours.contains("Aucun"),
                                      activeColor: Colors.indigo,
                                      onChanged: (valeur) {
                                        setState(() {
                                          if (valeur == true) {
                                            concours.add("Aucun");
                                          } else {
                                            concours.remove("Aucun");
                                          }
                                        });
                                      },
                                    ),
                                    const Expanded(child: Text("Aucun", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                const SizedBox(),
                                const SizedBox(),
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
                  String autreText='';
                  if(concours.isNotEmpty){
                    
                    widget.concours?.concours=concours;

                  } if(autreConcours.text.isNotEmpty){
                        autreText=autreConcours.text;
                        concours.add(autreText);
                        widget.concours?.concours=concours;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Etudes(
                        etudes: widget.concours,
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
    );
  }
}