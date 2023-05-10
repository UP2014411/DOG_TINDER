import 'package:dog_tinder/Home/pages/account.dart';
import 'package:dog_tinder/Home/pages/home.dart';
import 'package:dog_tinder/Home/pages/search.dart';
import 'package:dog_tinder/Home/pages/user.dart';
import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var height, width;
  int index = 0;
  PageController controller = PageController();
  @override
  void initState() {
    HomePagController.to.getUserProfile();
    super.initState();
  }

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
            Expanded(
              child: SizedBox(
                height: height,
                width: width,
                child: PageView(
                  children: [
                    HomePage(),
                    AccountPage(),
                    UserListPage(),
                  ],
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
              width: width,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.jumpToPage(0);
                      },
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: index == 0 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  color:
                                      index == 0 ? Colors.orange : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.jumpToPage(1);
                      },
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: index == 1 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Accounts',
                              style: TextStyle(
                                  color:
                                      index == 1 ? Colors.orange : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.jumpToPage(2);
                      },
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: index == 2 ? Colors.orange : Colors.grey,
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(
                                  color:
                                      index == 2 ? Colors.orange : Colors.grey),
                            )
                          ],
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
  }
}
