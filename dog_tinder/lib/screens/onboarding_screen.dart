import 'package:dog_tinder/helpers/sizes.dart';
import 'package:dog_tinder/helpers/values/global_keys.dart';
import 'package:dog_tinder/screens/demographics_screen.dart';
import 'package:dog_tinder/screens/description_screen.dart';
import 'package:dog_tinder/screens/email_screen.dart';
import 'package:dog_tinder/screens/location_screen.dart';
import 'package:dog_tinder/screens/pictures_screen.dart';
import 'package:dog_tinder/screens/start_screen.dart';
import 'package:dog_tinder/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const List<Tab> tabs = [
    Tab(
      text: 'Start',
    ),
    Tab(
      text: 'Email',
    ),
    Tab(
      text: 'Demographics',
    ),
    Tab(
      text: 'Pictures',
    ),
    Tab(
      text: 'Description',
    ),
    Tab(
      text: 'Location',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        return SafeArea(
            child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height(context) * 0.1),
            child: const CustomAppBar(
              titleText: 'Start',
              hasActions: false,
            ),
          ),
          body: TabBarView(
            children: [
              StartScreen(tabController: tabController),
              EmailScreen(tabController: tabController),
              DemographicsScreen(
                tabController: tabController,
              ),
              PicturesScreen(tabController: tabController),
              DescriptionScreen(tabController: tabController),
              LocationScreen(tabController: tabController),
            ],
          ),
        ));
      }),
    );
  }
}
