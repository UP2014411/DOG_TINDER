import 'package:dog_tinder/styles/app_style.dart';
import 'package:dog_tinder/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dog_tinder/widgets/card_provider.dart';
import 'package:dog_tinder/widgets/card_swipe_code.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // displays the profile cards to the users
      child: Scaffold(
        appBar: AppStyle.mainAppBar,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: profileCards(),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget profileCards() {
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImages;

    return urlImages.isEmpty
        ? Center(
            // refresh button for when profile cards run out
            child: MaterialButton(
              onPressed: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);

                provider.resetUsers();
              },
              color: Color.fromARGB(255, 255, 158, 128),
              elevation: 3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: const Text('Refresh'),
            ),
          )
        : Stack(
            // generates the profile cards
            children: urlImages
                .map((urlImage) => CardSwipe(
                      urlImage: urlImage,
                      isFront: urlImages.last == urlImage,
                    ))
                .toList(),
          );
  }
}
