import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/resources/auth_methods.dart';
import 'package:social/responsive/mobile_screen_lay.dart';
import 'package:social/responsive/responsive_screen.dart';
import 'package:social/responsive/web_screen_lay.dart';
import 'package:social/screens/login_screen.dart';
import 'package:social/utils/utils.dart';
import 'package:social/widgets/text_inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final TextEditingController _bioEditingController = TextEditingController();
  final TextEditingController _userNameEditingController =
      TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _passEditingController.dispose();
    _bioEditingController.dispose();
    _userNameEditingController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _textEditingController.text,
      pass: _passEditingController.text,
      username: _userNameEditingController.text,
      bio: _bioEditingController.text,
      file: _image!,
    ); //signupuser
    setState(() {
      _isLoading = false;
    });
    if (res != 'Success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Responsiveness(
              webScreenLay: WebScreenLay(), mobileScreenLay: MobileScreenLay()),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              //logo
              // Center(
              //   child: CustomText(shadow: [
              //     Shadow(
              //       blurRadius: 80,
              //       color: Colors.blue,
              //     )
              //   ], text: 'SOCIAL', fontSize: 70),
              // ),
              //gap
              const SizedBox(
                height: 30.0,
              ),
              //circular avatar
              Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 80,
                              color: Colors.blue,
                              spreadRadius: 5)
                        ],
                      ),
                      child: _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1666497674~exp=1666498274~hmac=6ed527a885972125c625d9a5636eed09cf2709b2e893de56324edbd0caccbec9'),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: -6,
                    left: 150,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
              //gap
              const SizedBox(
                height: 46.0,
              ),
              //text field username
              CustomTextField(
                  textEditingController: _userNameEditingController,
                  text: 'Enter Username',
                  textInputType: TextInputType.name),
              //gap
              const SizedBox(
                height: 30,
              ),
              //text field email
              CustomTextField(
                  textEditingController: _textEditingController,
                  text: 'Enter Email or Username',
                  textInputType: TextInputType.emailAddress),
              //gap
              const SizedBox(
                height: 30,
              ),
              //text field bio

              CustomTextField(
                  textEditingController: _bioEditingController,
                  text: 'Enter bio',
                  textInputType: TextInputType.text),

              //gap
              const SizedBox(
                height: 30.0,
              ),
              //password
              CustomTextField(
                  textEditingController: _passEditingController,
                  text: 'Enter Password',
                  textInputType: TextInputType.text,
                  isPass: true),
              const SizedBox(
                height: 30,
              ),
              //login button
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Sign Up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: Colors.blue),
                ),
              ),
              const SizedBox(height: 12),
              //transition to signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Already Have Account ?'),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: Text(
                        'Log In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
