import 'package:dog_tinder/Home/chat_screen.dart';
import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  var height, width;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    String chatRoomId(String user1, String user2) {
      if (user1[0].toLowerCase().codeUnits[0] >
          user2.toLowerCase().codeUnits[0]) {
        return "$user1$user2";
      } else {
        return "$user2$user1";
      }
    }

    return Scaffold(
      body: GetBuilder<HomePagController>(initState: (state) {
        HomePagController.to.getUserListMethod();
        HomePagController.to.getMylikesListMethod();
      }, builder: (obj) {
        return Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: height * 0.1,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Chats",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height,
                          width: width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(Icons.chat),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              const Icon(Icons.person)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.15,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Likes",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.04,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: obj.allMylikes.isEmpty
                                ? Center(child: Text('No MyLikes Found'))
                                : ListView.builder(
                                    itemCount: obj.allMylikes.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          // String id = chatRoomId(
                                          //     '${StaticData.userModel!.id}',
                                          //     '${obj.allMylikes[index].recipentID}');

                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           ChatScreen(
                                          //         chatroomId: id,
                                          //         userModel:
                                          //             obj.searchlist[index],
                                          //         profileModel:
                                          //             StaticData.userModel!,
                                          //         username:
                                          //             '${StaticData.userModel!.name}',
                                          //       ),
                                          //     ));
                                        },
                                        child: SizedBox(
                                          height: height,
                                          width: width * 0.2,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height * 0.05,
                                                width: width * 0.12,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(obj
                                                            .allMylikes[index]
                                                            .userImage!)),
                                                    shape: BoxShape.circle,
                                                    color: Colors.green),
                                              ),
                                              Text(obj
                                                  .allMylikes[index].userName!)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Chats",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.04,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: height * 0.06,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, right: width * 0.02),
                              child: TextFormField(
                                onChanged: (value) => searchFilter(value),
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: 'Enter the name'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Expanded(
                            child: Container(
                                height: height,
                                width: width,
                                alignment: Alignment.center,
                                child: obj.searchlist.isEmpty
                                    ? const Center(
                                        child: Text("No Record Found"))
                                    : ListView.builder(
                                        itemCount: obj.searchlist.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              String id = chatRoomId(
                                                  '${StaticData.userModel!.id}',
                                                  '${obj.searchlist[index].id}');

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatScreen(
                                                      chatroomId: id,
                                                      userModel:
                                                          obj.searchlist[index],
                                                      profileModel:
                                                          StaticData.userModel!,
                                                      username:
                                                          '${StaticData.userModel!.name}',
                                                    ),
                                                  ));
                                            },
                                            child: Container(
                                              height: height * 0.1,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height,
                                                    width: width * 0.2,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                            image: NetworkImage(obj
                                                                .searchlist[
                                                                    index]
                                                                .images![0]))),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.05,
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: height,
                                                      width: width,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(obj
                                                              .searchlist[index]
                                                              .name!),
                                                          Text(obj
                                                              .searchlist[index]
                                                              .email!),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ));
      }),
    );
  }

  void searchFilter(String enteredKeyword) {
    print(enteredKeyword);
    List<UserSignUpModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = HomePagController.to.allUserlist;
    } else {
      results = HomePagController.to.allUserlist
          .where((user) => user.name!
              .toLowerCase()
              .startsWith(enteredKeyword.toLowerCase().tr))
          .toList();
    }
    HomePagController.to.addDataToSearchList(results);
  }
}
