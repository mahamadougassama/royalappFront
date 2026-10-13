import 'package:college_royal/Models/admission.dart';
import 'package:dio/dio.dart';

class AdmissionService {
  Dio _dio=Dio(
    BaseOptions(baseUrl:"http://localhost:9003" ),

  );

Future<List<Admission>> findAll()async{

  final reponse=await _dio.get("/Admission/findAll");
  List<dynamic> list=reponse.data;
  List<Admission> admission=list.map((a)=>Admission.fromJson(a)).toList();
  return admission;
  
}
Future<void> save(Admission admission)async{
  try{
  await _dio.post("/Admission/save",data: admission.toJson());
  }catch(e){
    throw Exception(e);
  }
}

}