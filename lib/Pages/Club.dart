import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Pages/Colonie.dart';
import 'package:flutter/material.dart';

class Club extends StatefulWidget {
  SortieExtra? clubSortie;
   Club({super.key,
          this.clubSortie,
  });

  @override
  State<Club> createState() => _ClubState();
}

class _ClubState extends State<Club> {
  final List<String> club = [];
  TextEditingController autre=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Clubs",
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
                        Icon(Icons.sports_esports, color: Colors.indigo),
                        SizedBox(width: 12),
                        Text(
                          "CLUBS",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 700),
                        child: Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(children: [
                             Row(children: [
                            // 1. Robotique
                            Checkbox(
                              value: club.contains("Robotique"),
                              activeColor: Colors.indigo,
                              onChanged: (valeur) {
                                setState(() {
                                  if (valeur == true) {
                                    club.add("Robotique");
                                  } else {
                                    club.remove("Robotique");
                                  }
                                });
                              },
                            ),
                            const Expanded(child: Text("Robotique", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                            ]),
                            // 2. NTIC
                            Row(children: [
                            Checkbox(
                              value: club.contains("NTIC"),
                              activeColor: Colors.indigo,
                              onChanged: (valeur) {
                                setState(() {
                                  if (valeur == true) {
                                    club.add("NTIC");
                                  } else {
                                    club.remove("NTIC");
                                  }
                                });
                              },
                            ),
                            const Expanded(child: Text("NTIC", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                            ]),
                            Row(children: [
                            Checkbox(
                              value: club.contains("Arabe et Coran"),
                              activeColor: Colors.indigo,
                              onChanged: (valeur) {
                                setState(() {
                                  if (valeur == true) {
                                    club.add("Arabe et Coran");
                                  } else {
                                    club.remove("Arabe et Coran");
                                  }
                                });
                              },
                            ),
                            const Expanded(child: Text("Arabe et Coran", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),]),
                            Row(children: [
                            Checkbox(
                              value: club.contains("Basketball"),
                              activeColor: Colors.indigo,
                              onChanged: (valeur) {
                                setState(() {
                                  if (valeur == true) {
                                    club.add("Basketball");
                                  } else {
                                    club.remove("Basketball");
                                  }
                                });
                              },
                            ),
                            const Expanded(child: Text("Basketball", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),]),
                           
                          ]),
                          TableRow(
                            children: [
                               Row(children: [
                                // 1. English
                                Checkbox(
                                  value: club.contains("English"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("English");
                                      } else {
                                        club.remove("English");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("English", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                                ]),
                                // 2. Jeux
                                Row(children: [
                                Checkbox(
                                  value: club.contains("Jeux"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Jeux");
                                      } else {
                                        club.remove("Jeux");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Jeux", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                                ]),
                                Row(children: [
                                Checkbox(
                                  value: club.contains("Karate"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Karate");
                                      } else {
                                        club.remove("Karate");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Karate", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),]),
                                Row(children: [
                                Checkbox(
                                  value: club.contains("Academy d'Excellence"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Academy d'Excellence");
                                      } else {
                                        club.remove("Academy d'Excellence");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Academy d'Excellence", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                                ]),
                           ]
                          ),
                          TableRow(children: [
                               Row(children: [
                                // 1. Développement Personnel
                                Checkbox(
                                  value: club.contains("Développement Personnel"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Développement Personnel");
                                      } else {
                                        club.remove("Développement Personnel");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Développement Personnel", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                                ]),
                                // 2. Football
                                Row(children: [
                                Checkbox(
                                  value: club.contains("Football"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Football");
                                      } else {
                                        club.remove("Football");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Football", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                                ]),
                                Row(children: [
                                Checkbox(
                                  value: club.contains("Club Olympique"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Club Olympique");
                                      } else {
                                        club.remove("Club Olympique");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Club Olympique", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),]),
                                Row(children: [
                                Checkbox(
                                  value: club.contains("Matheopolis"),
                                  activeColor: Colors.indigo,
                                  onChanged: (valeur) {
                                    setState(() {
                                      if (valeur == true) {
                                        club.add("Matheopolis");
                                      } else {
                                        club.remove("Matheopolis");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Matheopolis", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),]),
                          ]),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                   Expanded(child:  TextField(
                                     controller: autre,
                                     decoration: InputDecoration(
                                       hintText: "Autre a precisé",
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
                                   ))
                                  ],
                                ),
                              ),
                              Row(children: [
                                Checkbox(
                                  value: club.contains("Aucun"),
                                  activeColor: Colors.indigo,
                                  onChanged:(valeur) {
                                    setState(() {
                                      if(valeur==true){
                                        club.add("Aucun");
                                      }else{
                                        club.remove("Aucun");
                                      }
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Aucun", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)))
                              ]),
                              Container(),
                              Container()
                            ]
                          )
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
                  if(club.isNotEmpty){
                   widget.clubSortie?.club=club;
                  }
                  if(autre.text.isNotEmpty){
                      autreText=autre.text;
                      club.add(autreText);
                      widget.clubSortie?.club=club;
                  }
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Colonie(
                        colonie: widget.clubSortie,
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