import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Models/admission.dart';
import 'package:college_royal/Pages/Activite.dart';
import 'package:college_royal/Pages/ActivitePage.dart';
import 'package:college_royal/Widegt/AdmissionState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformationComplemetairePage extends ConsumerStatefulWidget {
  final Admission information;
  const InformationComplemetairePage({
    super.key,
    required this.information
  
  });

  @override
  ConsumerState<InformationComplemetairePage> createState() => _InformationComplemetairePageState();
}

class _InformationComplemetairePageState extends ConsumerState<InformationComplemetairePage> {
  String? depart;
  TextEditingController accompagnant=TextEditingController();
  TextEditingController projet=TextEditingController();
  TextEditingController particularite=TextEditingController();
  TextEditingController sanguin=TextEditingController();
  TextEditingController medecin=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information Complementaire"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // PREMIÈRE CARTE : DÉPART DE L'ÉLÈVE
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.indigo.shade50,
                            child: const Icon(Icons.car_rental_sharp, color: Colors.indigo),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Départ de l'éléve à la descente de l'ecole",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      RadioListTile<String>(
                        title: const Text("Rentrez seule à la maison"),
                        value: 'seul',
                        groupValue: depart,
                        activeColor: Colors.indigo,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (valeur) {
                          setState(() {
                            depart = valeur;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text("Rentre à la maison accompagné par quelqu'un"),
                        value: 'accompagnée',
                        groupValue: depart,
                        activeColor: Colors.indigo,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (valeur) {
                          setState(() {
                            depart = valeur;
                          });
                        },
                      ),
                      TextField(
                      controller: accompagnant,
                      decoration: InputDecoration(
                        hintText: "Precisez l'indentite de on accompagnant",
                        prefixIcon: Icon(Icons.work_outline, color: Colors.indigo.shade300, size: 20),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.indigo, width: 2),
                        ),
                      ),
                    ),
                      RadioListTile<String>(
                        title: const Text("Autre"),
                        value: 'autre',
                        groupValue: depart,
                        activeColor: Colors.indigo,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (valeur) {
                          setState(() {
                            depart = valeur;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // DEUXIÈME CARTE : PROJET ÉDUCATIF & DIVERS
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
                      const Text(
                        "Projet Educatif",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: projet,
                        decoration: InputDecoration(
                          hintText: "Veuillez precisez le projet educatif de votre enfant",
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.indigo, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Divers",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: particularite,
                        decoration: InputDecoration(
                          hintText: "Veuillez precisez la particularite de votre enfant",
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.indigo, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: sanguin,
                        decoration: InputDecoration(
                          hintText: "quel est le groupe sanguin de votre nefant",
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.indigo, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: medecin,
                        decoration: InputDecoration(
                          hintText: "adresse et contact de son medecin",
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.indigo, width: 2),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
  elevation: 4,
  shadowColor: Colors.indigo.withOpacity(0.3),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Padding(
    padding: const EdgeInsets.all(20), // Espace interne pour ne pas coller les bords
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // En-tête de la carte
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade50,
              child: const Icon(Icons.folder_open_outlined, color: Colors.indigo),
            ),
            const SizedBox(width: 12),
            const Text(
              "Pièces à fournir",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        const Divider(height: 24), // Ligne de séparation élégante
        
        // Liste des pièces (avec vos valeurs d'origine)
        const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 10),
            Expanded(child: Text("Une copie d'acte de naissance", style: TextStyle(fontSize: 15))),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 10),
            Expanded(child: Text("Quatre photos d'identité", style: TextStyle(fontSize: 15))),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 10),
            Expanded(child: Text("Les bulletins de la dernière classe suivie", style: TextStyle(fontSize: 15))),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 10),
            Expanded(child: Text("Carnet scolaire/Certificat de fréquentattion", style: TextStyle(fontSize: 15))),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 10),
            Expanded(child: Text("Une copie légalisée de l'attestation du DEF(lycée)", style: TextStyle(fontSize: 15))),
          ],
        ),
      ],
    ),
  ),
),
              const SizedBox(height: 24),
         
              // BOUTON SUIVANT
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),  
                  onPressed: ()async {
                   widget.information.depart=depart;
                   widget.information.accompagnant=accompagnant.text;
                   widget.information.projet=projet.text;
                   widget.information.particularite=particularite.text;
                   widget.information.sanguin=sanguin.text;
                   widget.information.medecin=medecin.text;
                  final nouveau=await ref.read(admissionProvider.notifier).save(widget.information);
                final choix=await showDialog<bool>(context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Activite Extrat Scolaire"),
                      content: Text("Voulez vous nous renseignez sur les Activite Extrart Scolaire de votre enfant ?"),
                      actions: [
                        ElevatedButton(onPressed:(){
                          Navigator.pop(context,false);
                        }, child: Text("non")),
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context,true);
                        }, child: Text("oui"))
                      ],
                      
                    );
                  
                    
                  });
                  if(choix==true){
                   SortieExtra sortieExtra=SortieExtra();
                   sortieExtra.admission=nouveau;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Activite(
                    activite: sortieExtra,
                  )));
                  }
                  else if(choix==false){
                    showDialog(context: context, builder:
                    (context){
                      return AlertDialog(
                        content: Text("Admission Enregistrer"),
                        actions: [
                          ElevatedButton(onPressed: (){
                             Navigator.pop(context);
                          }, child: Text("OK"))
                        ],
                      );
                      
                    }
                  
                    );
                  }
                  
                  },
                  child: const Text(
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