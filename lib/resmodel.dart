import 'package:flutter/material.dart';
import 'package:flutter_app/res.dart';
import 'package:flutter/material.dart';

class resmodel extends StatelessWidget {

  ResItem res;

  resmodel(this.res);

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
           title:Text(res.Descreption) ,
           leading: CircleAvatar(
             radius: 30.0,
             backgroundImage:
             NetworkImage("${res.pic}"),
             backgroundColor: Colors.transparent,
           ),
              trailing : res.IsChoosen ? Icon(Icons.star,color: Colors.amber ):Icon(Icons.star_outline,color: Colors.amber),
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
