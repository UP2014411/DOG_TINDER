import 'package:dog_tinder/Home/notifcation_screen.dart';
import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:dog_tinder/widgets/card_swipe_code.dart';
import 'package:dog_tinder/widgets/choice_button.dart';
import 'package:dog_tinder/widgets/custom_app_bar.dart';
import 'package:dog_tinder/widgets/pet_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height, width;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<HomePagController>(initState: (state) {
            HomePagController.to.getUserListMethod();
          }, builder: (obj) {
            return SizedBox(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tindog',
                            style: GoogleFonts.lora(
                              fontSize: 25.sp,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotifcationScreen(),
                                  ));
                            },
                            child: Icon(
                              Icons.notifications,
                              size: width * 0.07,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  obj.allUserlist.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                // generates the profile cards
                                children: obj.allUserlist
                                    .map((urlImage) => CardSwipe(
                                          urlImage: urlImage,
                                          isFront:
                                              obj.allUserlist.last == urlImage,
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            );
            // : SizedBox(
            //     height: height,
            //     width: width,
            //     child: Column(
            //       children: [
            //         InkWell(
            //           onDoubleTap: () {
            //             // Navigator.pushNamed(context, PetDetailsScreen.routeName,
            //             //     arguments: state.pets[0]);
            //           },
            //           child: Draggable(
            //             child: PetCard(pet: obj.allUserlist[0]),
            //             feedback: PetCard(pet: obj.allUserlist[0]),
            //             childWhenDragging: (obj.allUserlist.length > 1)
            //                 ? PetCard(pet: obj.allUserlist[1])
            //                 : Container(),
            //             onDragEnd: (drag) {
            //               if (drag.velocity.pixelsPerSecond.dx < 0) {
            //                 obj.removeItem(obj.allUserlist[0]);
            //                 print("left");
            //                 // context
            //                 //     .read<SwipeBloc>()
            //                 //     .add(SwipeLeft(pet: state.pets[0]));
            //               } else {
            //                 obj.removeItem(obj.allUserlist[0]);
            //                 print("right");
            //                 // context
            //                 //     .read<SwipeBloc>()
            //                 //     .add(SwipeRight(pet: state.pets[0]));
            //               }
            //             },
            //           ),
            //         ),
            //         // Padding(
            //         //   padding: EdgeInsets.symmetric(
            //         //       vertical: width * 0.02, horizontal: width * 0.2),
            //         //   child: Row(
            //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //     children: [
            //         //       InkWell(
            //         //         onTap: () {
            //         //           // context
            //         //           //     .read<SwipeBloc>()
            //         //           //     .add(SwipeLeft(pet: state.pets[0]));
            //         //         },
            //         //         child: ChoiceButton(
            //         //           width: width * 0.1,
            //         //           height: height * 0.05,
            //         //           size: 25,
            //         //           color: Theme.of(context).primaryColor,
            //         //           iconData: Icons.clear_rounded,
            //         //           hasGradient: false,
            //         //         ),
            //         //       ),
            //         //       InkWell(
            //         //         onTap: () {
            //         //           // context
            //         //           //     .read<SwipeBloc>()
            //         //           //     .add(SwipeRight(pet: state.pets[0]));
            //         //         },
            //         //         child: ChoiceButton(
            //         //             width: width * 0.2,
            //         //             height: height * 0.07,
            //         //             hasGradient: true,
            //         //             size: 30,
            //         //             color: Theme.of(context).primaryColor,
            //         //             iconData: Icons.favorite),
            //         //       ),
            //         //       ChoiceButton(
            //         //           width: width * 0.1,
            //         //           height: height * 0.05,
            //         //           size: 25,
            //         //           color: Theme.of(context).primaryColor,
            //         //           iconData: Icons.watch_later,
            //         //           hasGradient: false),
            //         //     ],
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //   );
          })),
    );
  }
}
