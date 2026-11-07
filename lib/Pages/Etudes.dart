
import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Widegt/SortieState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Etudes extends ConsumerStatefulWidget {
  final SortieExtra etudes;

  const Etudes({super.key, required this.etudes});

  @override
  ConsumerState<Etudes> createState() => _EtudesState();
}

class _EtudesState extends ConsumerState<Etudes> {
  final TextEditingController autreEtude = TextEditingController();

  List<String> etude = [];

  @override
  void dispose() {
    autreEtude.dispose();
    super.dispose();
  }

  Future<void> sauvegarder() async {
    List<String> listeEtudes = [...etude];

    if (autreEtude.text.trim().isNotEmpty) {
      listeEtudes.add(autreEtude.text.trim());
    }

    widget.etudes.etude = listeEtudes;

    final succes = await ref
        .read(sortieProvider.notifier)
        .save(widget.etudes);

    if (!mounted) return;

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
          "Etudes Universitaire",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 700),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                construireChoix("Maroc"),
                                construireChoix("Europe"),
                                construireChoix("Canada"),
                                construireChoix("USA"),
                              ],
                            ),
                            TableRow(
                              children: [
                                construireChoix("Chine"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 4,
                                  ),
                                  child: TextField(
                                    controller: autreEtude,
                                    decoration: InputDecoration(
                                      hintText: "Autres à préciser",
                                      hintStyle:
                                          const TextStyle(fontSize: 12),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder:
                                          const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.indigo,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                construireChoix("Aucun"),
                                Container(),
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

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: sauvegarder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                icon: const Icon(Icons.save),
                label: const Text(
                  "Sauvegarder",
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

  Widget construireChoix(String valeur) {
    return Row(
      children: [
        Checkbox(
          value: etude.contains(valeur),
          activeColor: Colors.indigo,
          onChanged: (selectionne) {
            setState(() {
              if (valeur == "Aucun" && selectionne == true) {
                etude.clear();
                etude.add("Aucun");
              } else if (valeur == "Aucun") {
                etude.remove("Aucun");
              } else if (selectionne == true) {
                etude.remove("Aucun");
                etude.add(valeur);
              } else {
                etude.remove(valeur);
              }
            });
          },
        ),
        Text(
          valeur,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
