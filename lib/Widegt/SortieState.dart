import 'dart:math';

import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Service/SortieService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortieState {
final List<SortieExtra> sortieExtra;
final bool loading;
final String?erreur;
SortieState({
  this.sortieExtra=const[],
  this.loading=false,
  this.erreur=null
});
SortieState copyWith({
  List<SortieExtra>? sortieExtra,
  bool?loading,
  String?erreur
}){
  return SortieState(
    sortieExtra: sortieExtra??this.sortieExtra,
    loading: loading??this.loading,
    erreur: erreur
  );
}

}
class SortieNotifier extends Notifier<SortieState>{
  @override
  SortieState build() {
    return SortieState(
      loading: true
    );
  }
  SortieService _sortieService=SortieService();
  Future<void> findAll()async{
    try{
   final list= await _sortieService.findAll();
   state=state.copyWith(
    sortieExtra: list,
    loading: false
   );
   
    }catch(e){
      state=state.copyWith(
        loading: false,
        erreur: e.toString(),
      );
    }

  }
  Future<void> save(SortieExtra sortieExtra) async{
    try{
      final list=[
       ...state.sortieExtra,sortieExtra
      ];
      state=state.copyWith(
        sortieExtra: list,
        loading: false,erreur: null,
      );
     await _sortieService.save(sortieExtra);
    }catch(e){
      state=state.copyWith(
        erreur: e.toString(),
      );
    }
  }
}


final sortieProvider=NotifierProvider<SortieNotifier,SortieState>(() {
  return SortieNotifier();
},);