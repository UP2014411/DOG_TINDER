import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatroomId;
  final String username;
  final UserSignUpModel profileModel;
  final UserSignUpModel userModel;
  ChatScreen(
      {required this.chatroomId,
      required this.userModel,
      required this.profileModel,
      required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void onsendMessage() async {
    if (msgController.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendBy": widget.username,
        "message": msgController.text,
        "time": FieldValue.serverTimestamp()
      };
      await _firestore
          .collection('chatroom')
          .doc(widget.chatroomId)
          .collection('chats')
          .add(messages);
      msgController.clear();
    } else {
      print("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                color: Colors.grey[100],
                height: height * 0.04,
              ),
              Container(
                height: height * 0.1,
                width: width,
                color: Colors.grey[100],
                child: Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.02, left: width * 0.02),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.07,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              widget.userModel.images![0]))),
                                ),
                                Text('${widget.userModel.name}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('chatroom')
                        .doc(widget.chatroomId)
                        .collection('chats')
                        .orderBy("time", descending: false)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> map =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return messages(MediaQuery.of(context).size, map);
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: height * 0.07,
                width: width,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.01),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Center(
                              child: TextField(
                                controller: msgController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      InkWell(
                          onTap: () {
                            onsendMessage();
                          },
                          child: Container(
                            height: height,
                            width: width * 0.14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100]),
                            child: const Center(
                              child: Icon(
                                Icons.send,
                                color: Colors.grey,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget messages(Size size, Map<String, dynamic> map) {
    return Container(
      width: size.width,
      alignment: map['sendBy'] == widget.username
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              map['sendBy'] == widget.username ? Colors.grey[100] : Colors.blue,
        ),
        child: Text(
          map['message'],
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: map['sendBy'] == widget.username
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }
}
