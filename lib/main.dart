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
  int index = 0;
  List< ResItem> items = [
    ResItem(pic: 'https://static01.nyt.com/images/2021/04/07/dining/05Nafasrex2/merlin_185308044_d86614f1-5f30-4124-9d83-85da702bbed9-articleLarge.jpg',Descreption:"maqlupa" ,IsChoosen: false),
    ResItem(pic: 'https://www.cheftariq.com/wp-content/uploads/2020/04/mansaf-4-1.jpg',Descreption:"mansaf" ,IsChoosen: false),
    ResItem(pic: 'https://www.kitchensanctuary.com/wp-content/uploads/2015/02/Chicken-Shawarma-square-FS-57.jpg',Descreption:"shawerma" ,IsChoosen: false),

  ];
  List< ResItem> Favitems=[];

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
    for(int i=0;i<items.length;i++){
      Favitems.clear();
      if(items[i].IsChoosen){
        Favitems.add(items[i]);
      }
    };
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
                child:SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items.map((e) {
                        return resmodel(e);
                      }).toList()),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: Favitems.map((e) {
                        return resmodel(e);
                      }).toList()),
                ),
              ),
              Center(
                child: Text('Ple'),
              ),
            ]),
 );
  }
}
class resmodel extends StatefulWidget {

  ResItem res;

  resmodel(this.res);

  @override
  _resmodelState createState() => _resmodelState();
}

class _resmodelState extends State<resmodel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        color: Colors.transparent,
        child: Column(
          children: [
            ListTile(
              title:Text(widget.res.Descreption) ,
              leading: CircleAvatar(
                radius: 40.0,
                backgroundImage:
                NetworkImage("${widget.res.pic}"),
                backgroundColor: Colors.transparent,
              ),
              trailing : ElevatedButton(style:ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold)), onPressed: (){


                setState(() {
                  widget.res.IsChoosen=!widget.res.IsChoosen;
                });
              }, child:widget.res.IsChoosen ? Icon(Icons.star,color: Colors.amber ,): Icon(Icons.star_outline,color: Colors.amber) ),
            ),
          ],

        ));
  }
}

class ResItem{
  String pic;
  String Descreption;
  bool IsChoosen;

  ResItem({this.pic, this.Descreption, this.IsChoosen});
}

