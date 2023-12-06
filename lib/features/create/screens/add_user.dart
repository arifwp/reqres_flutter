import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reqres_flutter/common/custom_button.dart';
import 'package:reqres_flutter/common/custom_textfield.dart';
import 'package:reqres_flutter/constants/utils.dart';
import 'package:reqres_flutter/features/create/services/create_service.dart';

class AddUser extends StatefulWidget {
  static const String routeName = '/addUser-screen';
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  List<File> images = [];
  final _addUserFormKey = GlobalKey<FormState>();
  final CreateService createService = CreateService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }

  void addNewUser() {
    if (_addUserFormKey.currentState!.validate()) {
      createService.addNewUser(
        context: context,
        email: _emailController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('ReqRes.in'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addUserFormKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: selectImages,
                    child: Container(
                      width: 160,
                      height: 160,
                      child: CircleAvatar(
                        backgroundImage: images.isNotEmpty
                            ? Image.file(
                                images.first,
                                fit: BoxFit.fill,
                              ).image
                            : const NetworkImage(
                                'null',
                              ),
                        child: images.isEmpty
                            ? const Icon(Icons.camera_alt)
                            : null,
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  icon: const Icon(Icons.email),
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _firstNameController,
                  hintText: 'First Name',
                  icon: const Icon(Icons.person),
                  inputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _lastNameController,
                  hintText: 'Last Name',
                  icon: const Icon(Icons.person_2),
                  inputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  text: 'Submit',
                  onTap: addNewUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
