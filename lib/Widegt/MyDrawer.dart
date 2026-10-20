import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Supprime l'espace par défaut en haut
        children: [
          // En-tête du Drawer personnalisé
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar avec ombre et bordure propre
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("lib/asset/Images/logoCollege.png"),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Collège Royal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Éléments du menu avec de vrais libellés et icônes adaptées
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.indigo),
            title: const Text(
              "Accueil",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.person_add_outlined, color: Colors.indigo),
            title: const Text(
              "Eleve",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Remplacez par votre route d'inscription si nécessaire
              Navigator.pushNamed(context, '/eleve');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_outlined, color: Colors.indigo),
            title: const Text(
              "ACTIVITE EXTRA-SCOLAIRE",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Remplacez par votre route d'inscription si nécessaire
              Navigator.pushNamed(context, '/activite');
            },
          ),
          const Divider(), // Une petite ligne de séparation subtile

          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.indigo),
            title: const Text(
              "List Admission",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/listAdmission');
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text("Liste des Activite",style: TextStyle(color: Colors.indigo),),
            onTap: () {
              Navigator.pushNamed(context, '/listActivite');
            },
          )
        ],
      ),
    );
  }
}