
import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Widegt/SortieState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Cours extends ConsumerStatefulWidget {
  final SortieExtra cours;

  const Cours({super.key, required this.cours});

  @override
  ConsumerState<Cours> createState() => _CoursState();
}

class _CoursState extends ConsumerState<Cours> {
  final TextEditingController autrePremierCycle = TextEditingController();
  final TextEditingController autreSecondCycle = TextEditingController();
  final TextEditingController autreLycee = TextEditingController();

  final List<String> premierCycle = [];
  final List<String> secondCycle = [];
  final List<String> Lycee = [];

  bool enregistrement = false;

  @override
  void dispose() {
    autrePremierCycle.dispose();
    autreSecondCycle.dispose();
    autreLycee.dispose();
    super.dispose();
  }

  Future<void> sauvegarder() async {
    if (enregistrement) return;

    setState(() {
      enregistrement = true;
    });

    // Rassembler les matières des trois cycles.
    List<String> matieres = [
      ...premierCycle,
      ...secondCycle,
      ...Lycee,
    ];

    // Ajouter les matières personnalisées.
    if (autrePremierCycle.text.trim().isNotEmpty) {
      matieres.add(autrePremierCycle.text.trim());
    }

    if (autreSecondCycle.text.trim().isNotEmpty) {
      matieres.add(autreSecondCycle.text.trim());
    }

    if (autreLycee.text.trim().isNotEmpty) {
      matieres.add(autreLycee.text.trim());
    }

    // Enregistrer les matières dans le modèle.
    widget.cours.cours = matieres;

    // Enregistrer directement dans le backend.
    final succes = await ref
        .read(sortieProvider.notifier)
        .save(widget.cours);

    if (!mounted) return;

    setState(() {
      enregistrement = false;
    });

    if (succes) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text(
              "Merci !",
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "Le Collège Royal vous remercie pour votre fidélité et vous dit à bientôt !",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text("Terminer"),
              ),
            ],
          );
        },
      );

      if (!mounted) return;
      context.go('/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Échec de l'enregistrement. Veuillez réessayer.",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Cours À Domicile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
              const Text(
                "Sélection des Cours À Domicile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 3,
                shadowColor: Colors.indigo.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 700),
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
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade50,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                            ),
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "1er Cycle",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "2nd Cycle",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Lycée",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          // Ligne 1
                          TableRow(
                            children: [
                              _caseACocher(
                                liste: premierCycle,
                                valeur: "Toutes les Matiere",
                                texte: "Toutes les matières",
                              ),
                              _caseACocher(
                                liste: secondCycle,
                                valeur: "Mathematique",
                                texte: "Mathematique",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Column(
                                  children: [
                                    _caseSimple(
                                      liste: Lycee,
                                      valeur: "Economie",
                                    ),
                                    _caseSimple(
                                      liste: Lycee,
                                      valeur: "Comptabilite",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Ligne 2
                          TableRow(
                            children: [
                              _caseACocher(
                                liste: premierCycle,
                                valeur: "Français",
                                texte: "Français",
                              ),
                              _caseACocher(
                                liste: secondCycle,
                                valeur: "Physique-chimie",
                                texte: "Physique-chimie",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Column(
                                  children: [
                                    _caseSimple(
                                      liste: Lycee,
                                      valeur: "Mathematique",
                                    ),
                                    _caseSimple(
                                      liste: Lycee,
                                      valeur: "Physique-chimie",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Ligne 3
                          TableRow(
                            children: [
                              _caseACocher(
                                liste: premierCycle,
                                valeur: "Anglais",
                                texte: "Anglais",
                              ),
                              _caseACocher(
                                liste: secondCycle,
                                valeur: "Français",
                                texte: "Français",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Column(
                                  children: [
                                    _caseSimple(
                                      liste: Lycee,
                                      valeur: "SVT",
                                    ),
                                    _caseSimple(
                                      liste: Lycee,
                                      valeur: "Géologie",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Ligne 4 : Aucun
                          TableRow(
                            children: [
                              _caseACocher(
                                liste: premierCycle,
                                valeur: "Aucun",
                                texte: "Aucun",
                              ),
                              _caseACocher(
                                liste: secondCycle,
                                valeur: "Aucun",
                                texte: "Aucun",
                              ),
                              _caseACocher(
                                liste: Lycee,
                                valeur: "Aucun",
                                texte: "Aucun",
                              ),
                            ],
                          ),

                          // Ligne 5 : Autres à préciser
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                            ),
                            children: [
                              _champAutre(autrePremierCycle),
                              _champAutre(autreSecondCycle),
                              _champAutre(autreLycee),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: enregistrement ? null : sauvegarder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  icon: enregistrement
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(
                          Icons.save,
                          size: 20,
                        ),
                  label: Text(
                    enregistrement ? "Enregistrement..." : "Terminer",
                    style: const TextStyle(
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

  // Case à cocher avec texte personnalisé.
  Widget _caseACocher({
    required List<String> liste,
    required String valeur,
    required String texte,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(
            value: liste.contains(valeur),
            activeColor: Colors.indigo,
            onChanged: (valeurCochee) {
              setState(() {
                if (valeurCochee == true) {
                  liste.add(valeur);
                } else {
                  liste.remove(valeur);
                }
              });
            },
          ),
          Expanded(
            child: Text(
              texte,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // Case à cocher simple pour les matières du lycée.
  Widget _caseSimple({
    required List<String> liste,
    required String valeur,
  }) {
    return Row(
      children: [
        Checkbox(
          value: liste.contains(valeur),
          activeColor: Colors.indigo,
          onChanged: (valeurCochee) {
            setState(() {
              if (valeurCochee == true) {
                liste.add(valeur);
              } else {
                liste.remove(valeur);
              }
            });
          },
        ),
        Text(
          valeur,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  // Champ Autre.
  Widget _champAutre(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Autre...",
          hintStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.indigo,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
