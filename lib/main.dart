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
    ResItem(pic: 'https://lumiere-a.akamaihd.net/v1/images/frozen2-wallpaper-1_6e82a1c2.jpeg',Descreption:"frozen1" ,IsChoosen: false),
    ResItem(pic: 'https://image.winudf.com/v2/image/Y29tLmNpbmRlcmVsbGEuZGlzbmV5cHJpbmNlc3Nfc2NyZWVuXzBfMTUyNTMxOTc2MF8wNzc/screen-0.jpg?fakeurl=1&type=.jpg',Descreption:"sandrella movie" ,IsChoosen: false),
    ResItem(pic: 'https://wallpaperaccess.com/full/2022704.jpg',Descreption:"caroline movie" ,IsChoosen: false),

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
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO App'),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        color: Colors.green[50],
        child: Column(
          children: [
            ListTile(
              title:Text(widget.res.Descreption) ,
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage("${widget.res.pic}"),
                backgroundColor: Colors.transparent,
              ),
              trailing : ElevatedButton(onPressed: (){


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

