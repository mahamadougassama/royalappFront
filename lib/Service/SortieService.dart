import 'package:college_royal/Models/SortieExtra.dart';
import 'package:dio/dio.dart';

class SortieService {

Dio _dio=Dio(
  BaseOptions(
    baseUrl: "http://localhost:9003/Activite"
  )
   
);


Future<List<SortieExtra>> findAll()async{
  try{

  
 final reponse= await _dio.get("/findAll");
 List<dynamic> list=reponse.data;
 List<SortieExtra> sortie=list.map((s)=>SortieExtra.fromJson(s)).toList();
 return sortie;
  }catch(e){
    rethrow;
  }
}
Future<void> save(SortieExtra sortieExtra)async{
  try{
    await _dio.post("/save",data: sortieExtra.toJson());
  }catch(e){
    rethrow;
  }
}
}