import 'package:college_royal/Models/admission.dart';
import 'package:dio/dio.dart';

class AdmissionService {
  Dio _dio=Dio(
    BaseOptions(baseUrl:"http://localhost:9003/Admission" ),

  );

Future<List<Admission>> findAll(String token) async {
  final reponse = await _dio.get(
    "/findAll",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );

  List<dynamic> list = reponse.data;

  return list.map((a) => Admission.fromJson(a)).toList();
}
Future<Admission> save(Admission admission)async{
   try{
    final nouveau=await _dio.post("/save",data: admission.toJson());
    return Admission.fromJson(nouveau.data);
   }catch(e){
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