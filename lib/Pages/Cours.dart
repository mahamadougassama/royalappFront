import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Pages/Concours.dart';
import 'package:flutter/material.dart';

class Cours extends StatefulWidget {
  final SortieExtra cours;
  const Cours({super.key, required this.cours});

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  TextEditingController autrePremierCycle=TextEditingController();
  TextEditingController autreSecondCycle=TextEditingController();
  TextEditingController autreLycee=TextEditingController();
  final List<String> premierCycle = [];
  final List<String> secondCycle = [];
  final List<String> Lycee = [];
  @override
  void dispose() {
    autrePremierCycle.dispose();
    autreSecondCycle.dispose();
    autreLycee.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Cours À Domicile",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        elevation: 2,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre moderne de la section
              const Text(
                "Sélection des Cours À Domicile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 16),

              // Conteneur en Carte (Card) pour un effet propre et pro
              Card(
                elevation: 3,
                shadowColor: Colors.indigo.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Permet d'éviter tout dépassement sur les petits téléphones
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 700), // Largeur minimale pour garder les colonnes aérées
                      child: Table(
                        border: TableBorder.all(
                          color: Colors.indigo.shade100,
                          width: 1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                        },
                        children: [
                          // En-têtes du tableau
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade50,
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                            ),
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("1er Cycle", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 15), textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("2nd Cycle", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 15), textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("Lycée", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 15), textAlign: TextAlign.center),
                              ),
                            ],
                          ),

                          // Ligne 1 : Options principales
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: premierCycle.contains("Toutes les Matiere"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          premierCycle.add("Toutes les Matiere");
                                        } else {
                                          premierCycle.remove("Toutes les Matiere");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Toutes les matières", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: secondCycle.contains("Mathematique"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          secondCycle.add("Mathematique");
                                        } else {
                                          secondCycle.remove("Mathematique");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Mathematique", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Checkbox(
                                        value: Lycee.contains("Economie"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              Lycee.add("Economie");
                                            } else {
                                              Lycee.remove("Economie");
                                            }
                                          });
                                        },
                                      ),
                                      const Text("Economie", style: TextStyle(fontSize: 13)),
                                    ]),
                                    Row(children: [
                                      Checkbox(
                                        value: Lycee.contains("Comptabilite"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              Lycee.add("Comptabilite");
                                            } else {
                                              Lycee.remove("Comptabilite");
                                            }
                                          });
                                        },
                                      ),
                                      const Text("Comptabilite", style: TextStyle(fontSize: 13)),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Ligne 2 : Matières secondaires
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: premierCycle.contains("Français"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          premierCycle.add("Français");
                                        } else {
                                          premierCycle.remove("Français");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Français", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: secondCycle.contains("Physique-chimie"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          secondCycle.add("Physique-chimie");
                                        } else {
                                          secondCycle.remove("Physique-chimie");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Physique-chimie", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Checkbox(
                                        value: Lycee.contains("Mathematique"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              Lycee.add("Mathematique");
                                            } else {
                                              Lycee.remove("Mathematique");
                                            }
                                          });
                                        },
                                      ),
                                      const Text("Mathematique", style: TextStyle(fontSize: 13)),
                                    ]),
                                    Row(children: [
                                      Checkbox(
                                        value: Lycee.contains("Physique-chimie"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              Lycee.add("Physique-chimie");
                                            } else {
                                              Lycee.remove("Physique-chimie");
                                            }
                                          });
                                        },
                                      ),
                                      const Text("Physique-chimie", style: TextStyle(fontSize: 13)),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Ligne 3 : Anglais, SVT, etc.
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: premierCycle.contains("Anglais"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          premierCycle.add("Anglais");
                                        } else {
                                          premierCycle.remove("Anglais");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Anglais", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: secondCycle.contains("Français"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          secondCycle.add("Français");
                                        } else {
                                          secondCycle.remove("Français");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Français", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Checkbox(
                                        value: Lycee.contains("SVT"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              Lycee.add("SVT");
                                            } else {
                                              Lycee.remove("SVT");
                                            }
                                          });
                                        },
                                      ),
                                      const Text("SVT", style: TextStyle(fontSize: 13)),
                                    ]),
                                    Row(children: [
                                      Checkbox(
                                        value: Lycee.contains("Géologie"),
                                        activeColor: Colors.indigo,
                                        onChanged: (valeur) {
                                          setState(() {
                                            if (valeur == true) {
                                              Lycee.add("Géologie");
                                            } else {
                                              Lycee.remove("Géologie");
                                            }
                                          });
                                        },
                                      ),
                                      const Text("Géologie", style: TextStyle(fontSize: 13)),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Ligne 4 : Option "Aucun" pour les trois colonnes
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: premierCycle.contains("Aucun"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          premierCycle.add("Aucun");
                                        } else {
                                          premierCycle.remove("Aucun");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Aucun", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: secondCycle.contains("Aucun"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          secondCycle.add("Aucun");
                                        } else {
                                          secondCycle.remove("Aucun");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Aucun", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(children: [
                                  Checkbox(
                                    value: Lycee.contains("Aucun"),
                                    activeColor: Colors.indigo,
                                    onChanged: (valeur) {
                                      setState(() {
                                        if (valeur == true) {
                                          Lycee.add("Aucun");
                                        } else {
                                          Lycee.remove("Aucun");
                                        }
                                      });
                                    },
                                  ),
                                  const Expanded(child: Text("Aucun", style: TextStyle(fontSize: 13))),
                                ]),
                              ),
                            ],
                          ),

                          // Ligne 5 : Champs de texte "Autres à préciser"
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey.shade50),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: autrePremierCycle,
                                  decoration: InputDecoration(
                                    hintText: "Autre...",
                                    hintStyle: const TextStyle(fontSize: 12),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 1.5)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: autreSecondCycle,
                                  decoration: InputDecoration(
                                    hintText: "Autre...",
                                    hintStyle: const TextStyle(fontSize: 12),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 1.5)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: autreLycee,
                                  decoration: InputDecoration(
                                    hintText: "Autre...",
                                    hintStyle: const TextStyle(fontSize: 12),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 1.5)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                         
              
            
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 32),
            // BOUTON SUIVANT PLEINE LARGEUR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
  List<String> matieres = [];

  if (premierCycle.isNotEmpty) {
    matieres = [...premierCycle];
  } else if (secondCycle.isNotEmpty) {
    matieres = [...secondCycle];
  } else if (Lycee.isNotEmpty) {
    matieres = [...Lycee];
  }

  // Récupérer les matières saisies dans les champs Autre
  if (autrePremierCycle.text.trim().isNotEmpty) {
    matieres.add(autrePremierCycle.text.trim());
  }

  if (autreSecondCycle.text.trim().isNotEmpty) {
    matieres.add(autreSecondCycle.text.trim());
  }

  if (autreLycee.text.trim().isNotEmpty) {
    matieres.add(autreLycee.text.trim());
  }

  // Enregistrer dans le même objet
  widget.cours.cours = matieres;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Concours(
        concours: widget.cours,
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
              )),
            ],
          ),
        ),
      ),
    );
  }
}