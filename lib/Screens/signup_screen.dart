import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/Screens/loginscreen.dart';
import 'package:instagram_clone/Screens/widgets/text_field_input.dart';
import 'package:instagram_clone/resouces/auth_method.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
 bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void navigatorToLoginUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
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
      file: _image!,
    );

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                WebScreenLayout: WebScreenLayout(),
              )));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Flexible(
        flex: 2,
        child: Container(),
      ),
      SvgPicture.asset(
        'assets/ic_instagram.svg',
        // ignore: deprecated_member_use
        color: primaryColor,
        height: 64,
      ),
      const SizedBox(
        height: 64,
      ),
      //circular widger to accept and show our selected file
      // Stack(
      //   children: [
      //     const CircleAvatar(
      //       radius: 64,
      //       backgroundImage: NetworkImage(
      //         "https://images.unsplash.com/photo-1626808642875-0aa545482dfb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
      //       ),
      //     ),
      //     // IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo,),),
      //   ],
      // ),
      SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                : const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      "https://toppng.com/uploads/preview/instagram-default-profile-picture-11562973083brycehrmyv.png",
                    ),
                  ),
            Positioned(
                bottom: 0,
                right: -25,
                child: RawMaterialButton(
                  onPressed: () {
                    selectImage();
                  },
                  elevation: 2.0,
                  fillColor: Color(0xFFF5F6F9),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )),
          ],
        ),
      ),
      const SizedBox(
        height: 24,
      ),
      // Text Field input for user-name
      TextFieldInput(
          textEditingController: _usernameController,
          hintText: 'Enter your username',
          textInputType: TextInputType.text),
      const SizedBox(
        height: 24,
      ),
      // Text field input for email
      TextFieldInput(
          textEditingController: _emailController,
          hintText: 'Enter your email',
          textInputType: TextInputType.emailAddress),
      const SizedBox(
        height: 24,
      ),
      TextFieldInput(
        textEditingController: _passwordController,
        hintText: 'Enter your Password',
        textInputType: TextInputType.text,
        isPass: true,
      ),
      const SizedBox(
        height: 24,
      ),
      TextFieldInput(
          textEditingController: _bioController,
          hintText: 'Enter your bio',
          textInputType: TextInputType.text),
      const SizedBox(
        height: 24,
      ),
      // Container(
      //   child: const Text("Log in "),
      //   width: double.infinity,
      //   alignment: Alignment.center,
      //   padding: const EdgeInsets.symmetric(vertical: 12),
      //   decoration: const ShapeDecoration(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(4),
      //       ),
      //     ),
      //     color: blueColor,
      //   ),
      // ),
      Container(
        height: 45,
        width: double.infinity,
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        child: ElevatedButton(
          onPressed: () async {
            String res = await AuthMethods().signUpUser(
                email: _emailController.text,
                password: _passwordController.text,
                username: _usernameController.text,
                bio: _bioController.text,
                file: _image!);
            print(res);
          },
          child: Text("Sign up"),
        ),
      ),

      // Container(
      //   height: 45,
      //   width: double.infinity,
      //   decoration: const ShapeDecoration(
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(4)))),
      //   child: ElevatedButton(
      //     onPressed: () async {
      //       // Your sign-up logic
      //       // Set _isLoading to true to display the CircularProgressIndicator
      //       setState(() {
      //         _isLoading = true;
      //       });
      //       String res = await AuthMethods().signUpUser(
      //           email: _emailController.text,
      //           password: _passwordController.text,
      //           username: _usernameController.text,
      //           bio: _bioController.text,
      //           file: _image!);
      //       print(res);
      //       // Set _isLoading back to false when the process is complete
      //       setState(() {
      //         _isLoading = false;
      //       });
      //     },
      //     child: Text("Sign up"),
      //   ),
      // ),
      // // Show CircularProgressIndicator when _isLoading is true
      // if (_isLoading)
      //   CircularProgressIndicator(
      //     color: Colors.white,
      //   ),

      const SizedBox(
        height: 12,
      ),
      Flexible(
        flex: 2,
        child: Container(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              onPressed: () {
                navigatorToLoginUp();
              },
              child: const Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(text: "Already have an account? "),
                TextSpan(
                    text: "LogIn",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]))),
        ],
      )
    ]));
  }
}
