import 'package:college_royal/Models/admission.dart';

class SortieExtra {
  int? id;
  List<String>? activite;
  List<String>? club;
  List<String>? colonie;
  List<String>? cours;
  List<String>? concours;
  List<String>? etude;

  Admission? admission;

  SortieExtra();

  // Transformer l'objet en JSON
  Map<String, dynamic> toJson() {
    return {
      "activite": activite,
      "club": club,
      "colonie": colonie,
      "cours": cours,
      "concours": concours,
      "etude": etude,
      "admission": admission == null
          ? null
          : {
              "id": admission!.id,
            }
    };
  }

  // Transformer le JSON en objet SortieExtra
  factory SortieExtra.fromJson(Map<String, dynamic> json) {
    SortieExtra sortieExtra = SortieExtra();

    sortieExtra.id = json['id'];

    sortieExtra.activite = List<String>.from(json['activite'] ?? []);
    sortieExtra.club = List<String>.from(json['club'] ?? []);
    sortieExtra.colonie = List<String>.from(
      json['colonie'] ?? ['Non Identifier'],
    );
    sortieExtra.cours = List<String>.from(json['cours'] ?? []);
    sortieExtra.concours = List<String>.from(json['concours'] ?? []);
    sortieExtra.etude = List<String>.from(json['etude'] ?? []);

    sortieExtra.admission = json['admission'] != null
        ? Admission.fromJson(
            Map<String, dynamic>.from(json['admission']),
          )
        : null;

    return sortieExtra;
  }
}