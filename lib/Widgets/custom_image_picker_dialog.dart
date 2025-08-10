import 'package:e_commerce/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerDialog extends StatelessWidget {
  const CustomImagePickerDialog({super.key, required this.signUpCubit});
  final SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Center(
        child: Text(
          "Choose options",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.blueAccent,
              iconSize: 30,
            ),
            onPressed: () async {
              await ImagePicker()
                  .pickImage(source: ImageSource.camera)
                  .then((value) => signUpCubit.uploadProfilePic(value!));
              GoRouter.of(context).pop();
            },
            label: Text(
              "Camera",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            icon: Icon(Icons.camera),
          ),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.blueAccent,
              iconSize: 30,
            ),
            onPressed: () async {
              await ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) => signUpCubit.uploadProfilePic(value!));
              GoRouter.of(context).pop();
            },
            label: Text(
              "Gallery",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            icon: Icon(FontAwesomeIcons.image),
          ),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.blueAccent,
              iconSize: 30,
            ),
            onPressed: () {
              signUpCubit.imagePicker == null;
              GoRouter.of(context).pop();
            },
            label: Text(
              "Remove",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
