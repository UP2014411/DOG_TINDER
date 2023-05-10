import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/sizes.dart';

class CustomImageContainer extends StatefulWidget {
  final String? imageUrl;
  const CustomImageContainer({Key? key, this.imageUrl}) : super(key: key);

  @override
  State<CustomImageContainer> createState() => _CustomImageContainerState();
}

class _CustomImageContainerState extends State<CustomImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width(context) * 0.02, vertical: width(context) * 0.0003),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColorDark,
            ),
            top: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColorDark,
            ),
            left: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColorDark,
            ),
            right: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        child: widget.imageUrl == null
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                  ),
                  onPressed: () async {
                    ImagePicker _imagePicker = ImagePicker();
                    final _image = await _imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('No image was selected.')));
                    }
                    if (_image != null) {
                      //  context.read<OnBoardingBloc>().add(UpdateUserImages(image: _image));
                      //BlocProvider.of<OnBoardingBloc>(context)
                      //                    .add(UpdateUserImages(image: _image));
                    }
                  },
                ),
              )
            : Image.network(
                widget.imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
