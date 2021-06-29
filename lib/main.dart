import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res.dart';
import 'package:flutter_app/resmodel.dart';
void main() {
  runApp(MaterialApp(home: TodoPage()));
}
class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with SingleTickerProviderStateMixin {

  List< ResItem> res = [
    ResItem(pic: 'https://static01.nyt.com/images/2021/04/07/dining/05Nafasrex2/merlin_185308044_d86614f1-5f30-4124-9d83-85da702bbed9-articleLarge.jpg',Descreption:"maqlupa" ,IsChoosen: false),
    ResItem(pic: 'https://www.cheftariq.com/wp-content/uploads/2020/04/mansaf-4-1.jpg',Descreption:"mansaf" ,IsChoosen: false),
    ResItem(pic: 'https://www.kitchensanctuary.com/wp-content/uploads/2015/02/Chicken-Shawarma-square-FS-57.jpg',Descreption:"shawerma" ,IsChoosen: false),

  ];


  TabController tabController;
  initTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();

  }

  @override
  Widget build(BuildContext context) {
    List< ResItem> Favitems=[

    ];
   for(int i=0;i<res.length;i++){
     print(res[i].IsChoosen);
     if(res[i].IsChoosen){
       Favitems.add(res[i]);
     }
   }

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.red[700] ,
          title: Text('Resturant App'),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite',
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              Center(
               child:ListView.builder(
                 itemCount: res.length,
                 itemBuilder:(BuildContext ctxt, int index){
                 return ListTile(
                   leading:CircleAvatar(
                     radius: 30.0,
                     backgroundImage:
                     NetworkImage("${res[index].pic}"),
                     backgroundColor: Colors.transparent,
                   ),
                   title:Text(res[index].Descreption),
                   trailing:res[index].IsChoosen
                       ? TextButton(onPressed: () {
                         setState(() {
                           res[index].IsChoosen = !res[index].IsChoosen;
                         });

                   }, child: Icon(Icons.star, color: Colors.amber))
                       : TextButton(onPressed: () {
                     setState(() {
                       res[index].IsChoosen = !res[index].IsChoosen;
                     });
                   }, child: Icon(Icons.star_border, color: Colors.amber)),

                );
    } ,

               ),
                          ),
              Center(

                child:ListView.builder(
                  itemCount: Favitems.length,
                  itemBuilder:(BuildContext ctxt, int index){
                    return ListTile(
                      leading:CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                        NetworkImage("${Favitems[index].pic}"),
                        backgroundColor: Colors.transparent,
                      ),
                      title:Text(Favitems[index].Descreption),
                      trailing:Favitems[index].IsChoosen
                          ? TextButton(onPressed: () {
                        setState(() {
                          Favitems[index].IsChoosen = !Favitems[index].IsChoosen;
                        });

                      }, child: Icon(Icons.delete_outline, color: Colors.amber))
                          : TextButton(onPressed: () {
                        setState(() {
                          Favitems[index].IsChoosen = !Favitems[index].IsChoosen;
                        });
                      }, child: Icon(Icons.star, color: Colors.amber)),

                    );
                  } ,

                ),
              ),
              Center(
                child: Text('Ple'),

              ),
            ]),
 );
  }
}



