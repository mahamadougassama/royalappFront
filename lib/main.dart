import 'package:college_royal/Pages/Activite.dart';
import 'package:college_royal/Pages/ActivitePage.dart';
import 'package:college_royal/Pages/AdmissionPage.dart';
import 'package:college_royal/Pages/IdentiteElevePage.dart';
import 'package:college_royal/Pages/IdentiteParentPage.dart';
import 'package:college_royal/Pages/InformationComplemetairePage.dart';
import 'package:college_royal/Pages/acceuile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp( const ProviderScope(
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Royal',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/':(context) => Accueil(),
        '/activite':(context) => Activite(),
        '/listAdmission':(context) => AdmissionPage(),
        '/eleve':(context) => IdentiteElevePage(),
        '/listActivite':(context) => ActivitePage(),
      },
      initialRoute: '/',
    );
  }
}

