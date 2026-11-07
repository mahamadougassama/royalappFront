
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:college_royal/Widegt/AuthState.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final etat = ref.watch(authProvider);

    final estAdmin = etat.role == "ADMIN";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      "lib/asset/Images/logoCollege.png",
                    ),
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

          // Menus accessibles à tous

          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.indigo),
            title: const Text("Accueil"),
            onTap: () {
              context.go('/');
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_add_outlined, color: Colors.indigo),
            title: const Text("Eleve"),
            onTap: () {
              context.go('/eleve');
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_add_outlined, color: Colors.indigo),
            title: const Text("ACTIVITE EXTRA-SCOLAIRE"),
            onTap: () {
              context.go('/activite');
            },
          ),

          // Menus réservés à l'administrateur

          if (estAdmin) ...[
            const Divider(),

            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.indigo),
              title: const Text("Liste Admission"),
              onTap: () {
                context.go('/listAdmission');
              },
            ),

            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.indigo),
              title: const Text("Liste des Activite"),
              onTap: () {
                context.go('/listActivite');
              },
            ),
          ],
        ],
      ),
    );
  }
}
