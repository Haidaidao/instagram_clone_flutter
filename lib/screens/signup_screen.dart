import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!);
    

    if (res == "Success") {
        setState(() {
        _isLoading = false;
      });

      Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => ResponsiveLayout(
                        webScreenLayout: WebScreenLayout(),
                        mobileScreenLayout: MobileScreenLayout())));
    } else {
      showSnackBar(res, context);
    }
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 64,
                ),
                SvgPicture.asset(
                  'assets/ic_instagram.svg',
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(
                  height: 64,
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64, backgroundImage: MemoryImage(_image!))
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://scontent.fsgn13-2.fna.fbcdn.net/v/t39.30808-6/362275122_1669487676903686_1733069937313040904_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=vYYIrpy40esAX8mYeTN&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfBgPuDiFCiBWkNwBs7w6elbX2fQoUCbN7KvZP6w_nxILg&oe=64F03C28'),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: "Username",
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Password",
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _bioController,
                  hintText: "Your bio",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: signUpUser,
                  child: Container(
                    child: _isLoading? Center(child: CircularProgressIndicator(color: primaryColor,),) : Text('Sign up'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        color: blueColor),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Don't have an account? ",
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: Container(
                        child: Text(
                          "Login.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
