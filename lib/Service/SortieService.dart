
import 'package:college_royal/Models/SortieExtra.dart';
import 'package:dio/dio.dart';

class SortieService {

  Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:9003/Activite"
    )
  );

  // Récupérer toutes les activités
  Future<List<SortieExtra>> findAll(String token) async {
    try {
      final reponse = await _dio.get(
        "/findAll",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      List<dynamic> list = reponse.data;

      List<SortieExtra> sortie =
          list.map((s) => SortieExtra.fromJson(s)).toList();

      return sortie;

    } catch (e) {
      rethrow;
    }
  }

  // Enregistrer une activité
  Future<void> save(SortieExtra sortieExtra) async {
    try {
      await _dio.post(
        "/save",
        data: sortieExtra.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
  Future<String> delete(int id, String token) async {
  try {
    final reponse = await _dio.delete(
      "/delete",
      queryParameters: {
        "id": id,
      },
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return reponse.data.toString();

  } catch (e) {
    rethrow;
  }
}
}
