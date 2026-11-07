
import 'package:college_royal/Models/SortieExtra.dart';
import 'package:college_royal/Service/SortieService.dart';
import 'package:college_royal/Widegt/AuthState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortieState {
  final List<SortieExtra> sortieExtra;
  final bool loading;
  final String? erreur;

  SortieState({
    this.sortieExtra = const [],
    this.loading = false,
    this.erreur,
  });

  SortieState copyWith({
    List<SortieExtra>? sortieExtra,
    bool? loading,
    String? erreur,
  }) {
    return SortieState(
      sortieExtra: sortieExtra ?? this.sortieExtra,
      loading: loading ?? this.loading,
      erreur: erreur ?? this.erreur,
    );
  }
}

class SortieNotifier extends Notifier<SortieState> {
  final SortieService _sortieService = SortieService();

  @override
  SortieState build() {
    return SortieState(loading: true);
  }

  Future<void> findAll() async {
    try {
      // Récupérer le token depuis AuthState
      final token = ref.read(authProvider).token;

      if (token == null) {
        throw Exception("Utilisateur non connecté");
      }

      // Envoyer le token au service
      final list = await _sortieService.findAll(token);

      state = state.copyWith(
        sortieExtra: list,
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

  Future<bool> save(SortieExtra sortieExtra) async {
  try {
    await _sortieService.save(sortieExtra);

    final list = [...state.sortieExtra, sortieExtra];

    state = state.copyWith(
      sortieExtra: list,
      loading: false,
      erreur: null,
    );

    return true;
  } catch (e) {
    state = state.copyWith(
      loading: false,
      erreur: e.toString(),
    );

    return false;
  }
}
  Future<void> delete(int id) async {
  try {
    // 1. Récupérer le token
    final token = ref.read(authProvider).token;

    if (token == null) {
      throw Exception("Utilisateur non connecté");
    }

    // 2. Demander au backend de supprimer l'activité
    await _sortieService.delete(id, token);

    // 3. Créer une nouvelle liste sans l'activité supprimée
    final nouvelleListe = state.sortieExtra
        .where((sortie) => sortie.id != id)
        .toList();

    // 4. Actualiser l'état
    state = state.copyWith(
      sortieExtra: nouvelleListe,
    );

  } catch (e) {
    state = state.copyWith(
      erreur: e.toString(),
    );
  }
}
}

final sortieProvider =
    NotifierProvider<SortieNotifier, SortieState>(() {
  return SortieNotifier();
});
