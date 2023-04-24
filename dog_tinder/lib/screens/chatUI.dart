///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:dog_tinder/widgets/bottom_nav_bar.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});
  @override
  State<Chatscreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Chatscreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffff1515),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff212435),
            size: 18,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: 400,
        height: 700,
        decoration: BoxDecoration(
          color: Color(0x30f886d2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(0),
          shrinkWrap: false,
          physics: ScrollPhysics(),
          children: [
            ListTile(
              tileColor: Color(0x1f000000),
              title: Text(
                "Chat 1 ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                "Sub Title",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: Color(0x42000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              leading: Icon(Icons.alternate_email,
                  color: Color(0xff212435), size: 24),
            ),
            ListTile(
              tileColor: Color(0x1f000000),
              title: Text(
                "Chat 2",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                "Sub Title",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: Color(0x42000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              leading: Icon(Icons.alternate_email,
                  color: Color(0xff212435), size: 24),
            ),
            ListTile(
              tileColor: Color(0x1f000000),
              title: Text(
                "Chat 3",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                "Sub Title",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: Color(0x42000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              leading: Icon(Icons.alternate_email,
                  color: Color(0xff212435), size: 24),
            ),
            ListTile(
              tileColor: Color(0x1f000000),
              title: Text(
                "Chat 2",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                "Sub Title",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.start,
              ),
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              selected: false,
              selectedTileColor: Color(0x42000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              leading: Icon(Icons.alternate_email,
                  color: Color(0xff212435), size: 24),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
