import 'package:college_royal/Widegt/ImprimerActivite.dart';
import 'package:college_royal/Widegt/SortieState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitePage extends ConsumerStatefulWidget {
  
  ActivitePage({
    super.key
  });

  @override
  ConsumerState<ActivitePage> createState() => _ActivitePageState();
}

class _ActivitePageState extends ConsumerState<ActivitePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(sortieProvider.notifier).findAll();
  }

  @override
  Widget build(BuildContext context) {
    final etat=ref.watch(sortieProvider);
    if(etat.loading==true){
      return Scaffold(
        appBar: AppBar(
          title: Text("Liste des Activite"),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(),
        
        ),
      );
    }
    else if(etat.erreur!=null){
      return Scaffold(
        appBar: AppBar(
          title: Text("Liste des Activite"),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.all(20),
        child: Text("Erreur :${etat.erreur}"),
        
        ),
      );
    }
    else if(etat.sortieExtra.isNotEmpty){
      return Scaffold(
        appBar: AppBar(
          title: Text("Liste des Activite"),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.all(20),
        child: 
        ListView.builder(itemCount: etat.sortieExtra.length,
        
        itemBuilder: (context, index) {
          final activite=etat.sortieExtra[index];
          return Card(
           elevation: 3,
           shadowColor: Colors.grey,
           shape: BeveledRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6)
           ),
           child: Column(
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 2
                ),
                children: [
                  TableRow(
                    children: [
                      Text("SORTIE TRIMESTRIELLE & FÊTE "),

                    
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("${activite.activite}"),
                    ]
                  )
                ],
              ),
               SizedBox(height: 20,),
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 2
                ),
                children: [
                  TableRow(
                    children: [
                      Text("Club a Participer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("${activite.club}"),
                    ]
                  )
                ],
              ),
               SizedBox(height: 20,),
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 2
                ),
                children: [
                  TableRow(
                    children: [
                      Text("Colonie de Vacance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("${activite.colonie}"),
                    ]
                  )
                ],
              ),
               SizedBox(height: 20,),
              Table(
                border:TableBorder.all(
                     color: Colors.black,
                     width: 2
                ),
                children: [
                  TableRow(
                    children: [
                      Text("Cours a Domicile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("${activite.cours}"),
                    ]
                  )
                ],
              ),
               SizedBox(height: 20,),
              Table(
                border: TableBorder.all(
                  width: 2,
                  color: Colors.black
                ),
                children: [
                  TableRow(
                    children: [
                      Text("Concours a Participer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("${activite.concours}"),
                    ]
                  )
                ],
              ),
              SizedBox(height: 20,),
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 2
                ),
                
                children: [
                  TableRow(
                    children: [
                      Text("Etude a l'etranger",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("${activite.etude}"),
                    ]
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 ElevatedButton(onPressed: (){
                  
                 }, child: Icon(Icons.delete),

                 ),
                 ElevatedButton(onPressed: ()async{
                  await ImprimerActivite().ActiviteImprimer(activite);
                 }, child: Icon(Icons.alarm),
              
                 )
                ],
              )
            ],
           ),
          );
        },
        )
        
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste des Activite"),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.all(20),
        child: Text("Aucun List Trouver")
        
        ),
      );
    
  }
}