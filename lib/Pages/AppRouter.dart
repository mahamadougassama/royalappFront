
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:college_royal/Widegt/AuthState.dart';

import 'package:college_royal/Pages/acceuile.dart';
import 'package:college_royal/Pages/loginPage.dart';
import 'package:college_royal/Pages/IdentiteElevePage.dart';
import 'package:college_royal/Pages/Activite.dart';
import 'package:college_royal/Pages/ActivitePage.dart';
import 'package:college_royal/Pages/AdmissionPage.dart';

// Permet de notifier GoRouter des changements
class RouterNotifier extends ChangeNotifier {
  void actualiser() {
    notifyListeners();
  }
}

final routerProvider = Provider<GoRouter>((ref) {

  final notifier = RouterNotifier();

  // Observer les changements de connexion
  ref.listen(authProvider, (precedent, suivant) {
    notifier.actualiser();
  });

  final router = GoRouter(
    initialLocation: '/',

    refreshListenable: notifier,

    redirect: (context, state) {

      final auth = ref.read(authProvider);

      final estConnecte = auth.isConnected;
      final chemin = state.uri.path;

      // Pages accessibles sans connexion
      final pagesPubliques = [
        '/',
        '/login',
        '/eleve',
        '/activite',
        '/parents',
        '/informations-complementaires',
      ];

      final estPublic = pagesPubliques.contains(chemin);

      // Pages réservées à l'administrateur
      final pagesAdmin = [
        '/listAdmission',
        '/listActivite',
      ];

      // Vérifier si l'utilisateur est connecté
      if (!estConnecte && !estPublic) {
        return '/login';
      }

      // Vérifier le rôle de l'utilisateur
      if (pagesAdmin.contains(chemin) &&
          (!estConnecte || auth.role != 'ADMIN')) {
        return estConnecte ? '/' : '/login';
      }

      // Empêcher un administrateur connecté de revenir au login
      if (estConnecte && chemin == '/login') {
        return '/';
      }

      return null;
    },

    routes: [

      // Accueil
      GoRoute(
        path: '/',
        builder: (context, state) => Accueil(),
      ),

      // Connexion
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),

      // Inscription élève
      GoRoute(
        path: '/eleve',
        builder: (context, state) => IdentiteElevePage(),
      ),

      // Activités publiques
      GoRoute(
        path: '/activite',
        builder: (context, state) => Activite(),
      ),

      // Liste des admissions : ADMIN uniquement
      GoRoute(
        path: '/listAdmission',
        builder: (context, state) => AdmissionPage(),
      ),

      // Liste des activités : ADMIN uniquement
      GoRoute(
        path: '/listActivite',
        builder: (context, state) => ActivitePage(),
      ),
    ],
  );

  ref.onDispose(() {
    router.dispose();
    notifier.dispose();
  });

  return router;
});
