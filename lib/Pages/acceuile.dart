import 'package:college_royal/Widegt/MyDrawer.dart';
import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Logo avec un conteneur propre au lieu du CircleAvatar
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "lib/asset/Images/logoCollege.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Titre principal
                const Text(
                  "COLLÈGE ROYAL",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Sous-titre Année
                Text(
                  "Admissions 2026-2027",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Texte de bienvenue combiné et centré
                const Text(
                  "Bienvenue sur la plateforme\nd'inscription du Collège Royal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 48),
                
                // Bouton d'action moderne
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
                      Navigator.pushNamed(context, "/eleve");
                    },
                    child: const Text(
                      "Commencer l'inscription",
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