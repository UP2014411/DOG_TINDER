import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifcationScreen extends StatefulWidget {
  const NotifcationScreen({super.key});

  @override
  State<NotifcationScreen> createState() => _NotifcationScreenState();
}

class _NotifcationScreenState extends State<NotifcationScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              width: width,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  'Notifcations',
                  style: GoogleFonts.lora(
                    fontSize: 25.sp,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<HomePagController>(initState: (state) {
                HomePagController.to
                    .getUserNotifcationListMethod()
                    .then((value) {
                  print(value);
                });
              }, builder: (obj) {
                return SizedBox(
                    height: height,
                    width: width,
                    child: obj.notifcationList.isEmpty
                        ? Center(child: Text("No Notification Found"))
                        : ListView.builder(
                            itemCount: obj.notifcationList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.05),
                                child: Container(
                                  height: height * 0.15,
                                  width: width,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(obj
                                                    .notifcationList[index]
                                                    .userPic!))),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: height,
                                          width: width,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                obj.notifcationList[index]
                                                    .userName!,
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              Text(
                                                obj.notifcationList[index]
                                                    .email!,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height,
                                        width: width * 0.25,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                obj.updateNoticationStatus(
                                                    obj.notifcationList[index],
                                                    "Accept");
                                              },
                                              child: Container(
                                                height: height * 0.06,
                                                width: width * 0.2,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "accept",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                obj.updateNoticationStatus(
                                                    obj.notifcationList[index],
                                                    "Rejected");
                                              },
                                              child: Container(
                                                height: height * 0.06,
                                                width: width * 0.2,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "Reject",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
