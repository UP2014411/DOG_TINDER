import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:dog_tinder/widgets/choice_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PetDetailsScreen extends StatefulWidget {
  final UserSignUpModel pet;
  const PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.7,
                width: width,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.1),
                      child: Hero(
                        tag: 'pet_image',
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.pet.images![0],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: kColorWhite,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.pet.name}, ${widget.pet.age}',
                        style: GoogleFonts.lora(
                          fontSize: 18.sp,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        )),
                    Row(
                      children: [
                        Text('${widget.pet.breed}, ${widget.pet.gender}',
                            style: GoogleFonts.lora(
                              fontSize: 15.sp,
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                            )),
                        widget.pet.gender == 'Female'
                            ? const Icon(
                                Icons.female,
                                color: kColorRed,
                              )
                            : const Icon(Icons.male, color: kColorBlue)
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text('About',
                        style: GoogleFonts.lora(
                          fontSize: 20.sp,
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        )),
                    Text(widget.pet.bio!,
                        style: GoogleFonts.lora(
                          fontSize: 12.sp,
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
