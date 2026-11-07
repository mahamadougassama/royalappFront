import 'package:college_royal/Models/admission.dart';
import 'package:college_royal/Service/AdmissionService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:college_royal/Widegt/AuthState.dart';

class AdmissionState {
final List<Admission> admission;
final bool loading;
final String? erreur;
AdmissionState({
  this.admission=const [],
  this.loading=false,
  this.erreur=null
});

AdmissionState copyWith({
  List<Admission>?admission,
  bool?loading,
  String?erreur,
}){
 return AdmissionState(
    admission: admission??this.admission,
    loading: loading??this.loading,
    erreur: erreur??this.erreur
 );
}

}

class AdmissionNotifier extends Notifier<AdmissionState> {
  AdmissionService _admissionService=AdmissionService();
  @override
  AdmissionState build() {
    return AdmissionState(
      loading: true
    );
  }
  Future<void> findAll() async {
  try {
    final token = ref.read(authProvider).token;

    if (token == null) {
      throw Exception("Utilisateur non connecté");
    }

    final list = await _admissionService.findAll(token);

    state = state.copyWith(
      admission: list,
      loading: false,
      erreur: null,
    );
  } catch (e) {
    state = state.copyWith(
      loading: false,
      erreur: e.toString(),
    );
  }
}
    Future<Admission> save(Admission admission)async{
      try{
    final nouveau=await _admissionService.save(admission);
    final list=[...state.admission,nouveau];
    state=state.copyWith(
      admission: list,
      erreur: null,
      loading: false
    );
    return nouveau;
      }catch(e){
      state=state.copyWith(
        erreur: e.toString(),
      );
      rethrow;
      }
    }
    Future<void> delete(int id) async {
  try {
    final token = ref.read(authProvider).token;

    if (token == null) {
      throw Exception("Utilisateur non connecté");
    }

    await _admissionService.delete(id, token);

    final nouvelleListe = state.admission
        .where((admission) => admission.id != id)
        .toList();

    state = state.copyWith(
      admission: nouvelleListe,
      erreur: null,
    );

  } catch (e) {
    state = state.copyWith(
      erreur: e.toString(),
    );
  }
}
   
}
 final admissionProvider= NotifierProvider<AdmissionNotifier,AdmissionState>(() {
   return AdmissionNotifier();
 },);

