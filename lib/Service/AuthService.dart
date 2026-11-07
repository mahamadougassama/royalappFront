
import 'package:college_royal/Models/User.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:9003/Auth",
    ),
  );

  Future<Map<String, dynamic>> login(User user) async {
    final reponse = await _dio.post(
      "/login",
      data: user.toJson(),
    );


    final String token = reponse.data['token'];

final donnees = JwtDecoder.decode(token);

final String role = donnees['role'];


    return {
      "token": token,
      "role": role,
    };
  }
}
