import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syd/components/my_button.dart';
import 'package:syd/components/my_text_field.dart';
import 'package:syd/components/utils.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final nameController = TextEditingController();
  //image variable
  Uint8List? _image;
  //select image function
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
                child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Profile Info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please provide your name and an optional profile picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 25),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 70,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('lib/img/default_profile.webp'),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 90,
                      child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                MyTextField(
                    controller: nameController,
                    hintText: 'Type your name here...',
                    obscureText: false),
                const SizedBox(height: 25),
                MyButton(onTap: () {}, text: 'Next'),
              ],
            ),
          ),
        ))));
  }
}
