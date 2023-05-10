import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';

class PetImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final EdgeInsets? margin;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Widget? child;

  const PetImage.medium(
      {Key? key,
      this.url,
      this.height = 200,
      this.width = double.infinity,
      this.margin,
      this.boxShadow,
      this.border,
      this.child})
      : super(key: key);

  const PetImage.small(
      {Key? key,
      this.url,
      this.height = 60,
      this.width = 60,
      this.margin,
      this.boxShadow,
      this.border,
      this.child})
      : super(key: key);

  const PetImage.large({
    Key? key,
    this.url,
    this.height = double.infinity,
    this.width = double.infinity,
    this.margin,
    this.boxShadow,
    this.border,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: (url == null)
                ? const AssetImage('assets/images/placeholder_image.png')
                    as ImageProvider
                : NetworkImage(url!),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: border,
          boxShadow: boxShadow,
          color: kCanvasMainColor),
      child: child,
    );
  }
}
