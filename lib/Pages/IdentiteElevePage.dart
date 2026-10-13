import 'dart:js_interop';

import 'package:college_royal/Models/admission.dart';
import 'package:college_royal/Pages/IdentiteParentPage.dart';
import 'package:college_royal/Widegt/MyDrawer.dart';
import 'package:flutter/material.dart';

class IdentiteElevePage extends StatefulWidget {
  const IdentiteElevePage({super.key});

  @override
  State<IdentiteElevePage> createState() => _IdentiteElevePageState();
}

class _IdentiteElevePageState extends State<IdentiteElevePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomEleve=TextEditingController();
  TextEditingController dateLieuNaissance=TextEditingController();
  TextEditingController Nationalite=TextEditingController();
  TextEditingController classActuelle=TextEditingController();
  TextEditingController etablissementFrequente=TextEditingController();
  TextEditingController residence=TextEditingController();
  TextEditingController rue=TextEditingController();
  TextEditingController porte=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Identité de l'élève"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // CARTE 1 : INFORMATIONS SUR L'ÉLÈVE
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
                              child: const Icon(Icons.person, color: Colors.indigo),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                "Informations sur l'eleve",
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
                        TextField(
                          controller: nomEleve,
                          decoration: InputDecoration(
                            labelText: "Nom et Prénom",
                            prefixIcon: Icon(Icons.person_outline, color: Colors.indigo.shade300),
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
                        const SizedBox(height: 16),
                        TextField(
                          controller: dateLieuNaissance,
                          decoration: InputDecoration(
                            labelText: "Date et lieu de naissance",
                            prefixIcon: Icon(Icons.cake_outlined, color: Colors.indigo.shade300),
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
                        const SizedBox(height: 16),
                        TextField(
                          controller:Nationalite ,
                          decoration: InputDecoration(
                            labelText: "Nationalité",
                            prefixIcon: Icon(Icons.flag_outlined, color: Colors.indigo.shade300),
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
                        const SizedBox(height: 16),
                        TextField(
                          controller:  classActuelle,
                          decoration: InputDecoration(
                            labelText: "Classe actuelle",
                            prefixIcon: Icon(Icons.school_outlined, color: Colors.indigo.shade300),
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
                        const SizedBox(height: 16),
                        TextField(
                          controller: etablissementFrequente,
                          decoration: InputDecoration(
                            labelText: "Établissement fréquenté",
                            prefixIcon: Icon(Icons.business_outlined, color: Colors.indigo.shade300),
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

                // CARTE 2 : COORDONNÉES & RÉSIDENCE
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
                          "Coordonnées & Résidence",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: residence,
                          decoration: InputDecoration(
                            labelText: "Résidence (Ville / Quartier)",
                            prefixIcon: Icon(Icons.location_city_outlined, color: Colors.indigo.shade300),
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
                        const SizedBox(height: 16),
                        TextField(
                          controller:  rue,
                          decoration: InputDecoration(
                            labelText: "Rue ",
                            prefixIcon: Icon(Icons.home_outlined, color: Colors.indigo.shade300),
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
                        const SizedBox(height: 16),
                        TextField(
                          controller:  porte,
                          decoration: InputDecoration(
                            labelText: " Porte",
                            prefixIcon: Icon(Icons.home_outlined, color: Colors.indigo.shade300),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       Admission eleve=Admission();
                       eleve.nomEleve=nomEleve.text;
                       eleve.dateLieuNaissance=dateLieuNaissance.text;
                       eleve.nationalite=Nationalite.text;
                       eleve.classActuelle=classActuelle.text;
                       eleve.etablissementFrequente=etablissementFrequente.text;
                       eleve.residence=residence.text;
                       eleve.rue=rue.text;
                       eleve.porte=porte.text;
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>IdentiteParentPage(parent: eleve)));
                    }},
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
      ),
    );
  }
}