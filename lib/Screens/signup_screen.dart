import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Screens/widgets/text_field_input.dart';
import 'package:instagram_clone/utils/colors.dart';

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
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
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1626808642875-0aa545482dfb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
              ),
            ),
            Positioned(
                bottom: 0,
                right: -25,
                child: RawMaterialButton(
                  onPressed: () {},
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
          onPressed: () {},
          child: Text("Sign up"),
        ),
      ),
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
              onPressed: () {},
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
