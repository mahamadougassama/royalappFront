import 'package:college_royal/Models/admission.dart';
import 'package:dio/dio.dart';

class AdmissionService {
  Dio _dio=Dio(
    BaseOptions(baseUrl:"http://localhost:9003/Admission" ),

  );

Future<List<Admission>> findAll()async{

  final reponse=await _dio.get("/findAll");
  List<dynamic> list=reponse.data;
  List<Admission> admission=list.map((a)=>Admission.fromJson(a)).toList();
  return admission;
  
}
Future<Admission> save(Admission admission)async{
   try{
    final nouveau=await _dio.post("/save",data: admission.toJson());
    return Admission.fromJson(nouveau.data);
   }catch(e){
    rethrow;
   }
}

}