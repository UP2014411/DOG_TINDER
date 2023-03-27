///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'flutterViz_bottom_navigationBar_model.dart';


class HomeScreen extends StatelessWidget {
List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems = [FlutterVizBottomNavigationBarModel(icon:Icons.home,label:"Home"), FlutterVizBottomNavigationBarModel(icon:Icons.account_circle,label:"Account"), FlutterVizBottomNavigationBarModel(icon:Icons.chat,label:"Chat"), FlutterVizBottomNavigationBarModel(icon:Icons.youtube_searched_for,label:"Search")];

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:4,
centerTitle:false,
automaticallyImplyLeading: false,
backgroundColor:Color(0xffff1515),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Matches 🐶",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
leading: Icon(
Icons.arrow_back_ios,
color:Color(0xff212435),
size:18,
),
),
bottomNavigationBar: BottomNavigationBar(
items: flutterVizBottomNavigationBarItems.map((FlutterVizBottomNavigationBarModel item) {
return BottomNavigationBarItem(
icon: Icon(item.icon),
label: item.label
, );
 }).toList(),
backgroundColor: Color(0x00ffbf4b),
currentIndex: 0,
elevation: 8,
iconSize: 20,
selectedItemColor: Color(0xff3a57e8),
unselectedItemColor: Color(0xff9e9e9e),
selectedFontSize: 14,
unselectedFontSize:14,
showSelectedLabels: true,
showUnselectedLabels: true,
onTap: (value){},
),
body:Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:1080,
height:1920,
decoration: BoxDecoration(
color:Color(0x1fff5cbc),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4d9e9e9e),width:1),
),
child:

ListView(
scrollDirection: Axis.vertical,
padding:EdgeInsets.all(0),
shrinkWrap:false,
physics:ScrollPhysics(), 
children:[

ListTile(
tileColor:Color(0x99fff6a4),
title:Text("You've matched with user_name",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
subtitle:Text("Throw them a bone?",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
dense:false,
contentPadding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
selected:false,
selectedTileColor:Color(0x42000000),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side: BorderSide(color:Color(0x4d9e9e9e), width:1),
),
trailing:Icon(Icons.favorite,color:Color(0xffff0000),size:24),
),
ListTile(
tileColor:Color(0x99fff6a4),
title:Text("You've matched with user_name2",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
subtitle:Text("Throw them a bone?",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
dense:false,
contentPadding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
selected:false,
selectedTileColor:Color(0x42000000),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side: BorderSide(color:Color(0x4d9e9e9e), width:1),
),
trailing:Icon(Icons.favorite,color:Color(0xffff0000),size:24),
),
],),
),
)
;}
}
