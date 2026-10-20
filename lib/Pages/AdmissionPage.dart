import 'package:college_royal/Models/admission.dart';
import 'package:college_royal/Widegt/AdmissionState.dart';
import 'package:college_royal/Widegt/ImprimerPdf.dart';
import 'package:college_royal/Widegt/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AdmissionPage extends ConsumerStatefulWidget {
    AdmissionPage({super.key});

  @override
  ConsumerState<AdmissionPage> createState() => _AdmissionPageState();
}

class _AdmissionPageState extends ConsumerState<AdmissionPage> {
 
@override
  void initState() {
    
    super.initState();
    Future.microtask((){
      ref.read(admissionProvider.notifier).findAll();
    });
  }



    @override
  Widget build(BuildContext context) {
  final state=ref.watch(admissionProvider);
  if(state.loading==true){
    return Scaffold(
     appBar: AppBar(
      title: Text("Liste des Admission"),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      centerTitle: true,
     ),
     drawer: MyDrawer(),
     body: Padding(padding: EdgeInsets.all(20),
     child: Center(child: CircularProgressIndicator(color: Colors.indigo)),
     ),
    );
  };
  if(state.erreur!=null){
     return Scaffold(
     appBar: AppBar(
      title: Text("Liste des Admission"),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      centerTitle: true,
     ),
     drawer: MyDrawer(),
     body: Padding(padding: EdgeInsets.all(20),
     child: Center(child: Text("Une erreur c'est survernue ${state.erreur}", style: TextStyle(color: Colors.red)))
     ),
    );
  };
  if(state.admission.isNotEmpty){
     return Scaffold(
     appBar: AppBar(
      title: Text("Liste des Admission"),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      centerTitle: true,
     ),
     drawer: MyDrawer(),
     body: Padding(padding: EdgeInsets.all(16),
     child: ListView.builder(
      itemCount: state.admission.length,
      itemBuilder: (context, index) {
        final a=state.admission[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Card(
           elevation: 3,
           shadowColor: Colors.indigo.withOpacity(0.2),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16)
           ),
           child: Padding(
               padding: EdgeInsets.all(20),
               child: 
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [  
            
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.person, color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Text("L'identite de l'Eleve",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                ),),
              ],
            ), 
            Divider(height: 24),
            Text("Prenom et Nom:  ${a.nomEleve}"),
            SizedBox(height: 6),
            Text("Date et Lieu de Naissance: ${a.dateLieuNaissance}"),   
            SizedBox(height: 6),
            Text("Nationalité: ${a.nationnalite}"),
            SizedBox(height: 6),
            Text("Classe Actuelle: ${a.classActuelle}"),
            SizedBox(height: 6),
            Text("Etablissement: ${a.etablissementFrequente}"),
            SizedBox(height: 6),
            Text("Residence: ${a.residance}"),
            SizedBox(height: 6),
            Text("Rue:${a.rue}"),
            SizedBox(height: 6),
            Text("Porte:${a.porte}"),
            SizedBox(height: 20),
            
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.female, color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Text("L'identite Des Parents",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                )
                ),
              ],
            ),
            Divider(height: 24),
            
            Text("Prenom et Nom:  ${a.nomMere}"),
            SizedBox(height: 6),
            Text("Profession: ${a.professionMere}"),   
            SizedBox(height: 6),
            Text("Adresse Contact: ${a.adresseContactMere}"),

             SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.male, color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Text("L'identite Des Parents",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                )
                ),
              ],
            ),
            Divider(height: 24),
            Text("Prenom et Nom:  ${a.nomPere}"),
            SizedBox(height: 6),
            Text("Profession: ${a.professionPere}"),   
            SizedBox(height: 6),
            Text("Adresse Contact: ${a.adresseContactPere}"),
            SizedBox(height: 20),

            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.car_rental_sharp, color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Text("Depart de L'élève",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.indigo)),
              ],
            ),
            Divider(height: 24),
            Text("depart: ${a.depart}"),
            SizedBox(height: 20),

            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.school_outlined, color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Text("Projet educatif de l'Elève",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                )
                ),
              ],
            ),
            Divider(height: 24),
            Text("Projet:  ${a.projet}"),
            
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.folder_open_outlined, color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Text("Divers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                )
                ),
              ],
            ),
            Divider(height: 24),
            Text("la particularite de l'eleve: ${a.particularite}"),
            SizedBox(height: 6),
            Text("Le groupe sanguin de l'eleve:  ${a.sanguin}"),
            SizedBox(height: 6),
            Text("Adresse Contact du medecin: ${a.medecin}"),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: ()async{

                }, icon: Icon(Icons.delete, color: Colors.red)),
                IconButton(onPressed: ()async{
                  
                 await ImprimerPdf().imprimerAdmission(a);

                }, icon: Icon(Icons.update, color: Colors.indigo))
              ],
            )
          ],
        ))),
        );
     },
     ),
     ),
    );
  }
  return Scaffold(
 appBar: AppBar(
    title: Text("List des Admissions"),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    centerTitle: true,
 ),
 drawer: MyDrawer(),
 body: Padding(padding: EdgeInsets.all(20),
 child: Center(child: Text("aucune Admission n'est disponible", style: TextStyle(fontSize: 16, color: Colors.grey))),
 ),
);
  }
}