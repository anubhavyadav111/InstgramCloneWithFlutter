import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Screens/signup_screen.dart';
import 'package:instagram_clone/Screens/widgets/text_field_input.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import '../resouces/auth_method.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void navigatorToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (res == "success") {
      //
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => HomeScreen()));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                WebScreenLayout: WebScreenLayout(),
              )));
    } else {
      showSnackBar(context, res);
    }
    setState(() {
      _isloading = false;
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
          onPressed: () {
            loginUser();
          },
          child: _isloading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text("log In"),
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
          // Container(
          //   child: Text(
          //     "Don't have an account?",
          //     style: TextStyle(
          //       fontWeight: FontWeight.normal,
          //     ),
          //   ),
          // )

          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              onPressed: () {
                navigatorToSignup();
              },
              child: const Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(text: "Don't have an account?"),
                TextSpan(
                    text: "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]))),
          // TextButton(
          //     onPressed: () {},
          //     style: TextButton.styleFrom(
          //         foregroundColor: Colors.white,
          //         padding: EdgeInsets.zero,
          //         minimumSize: Size(50, 30),
          //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //         alignment: Alignment.centerLeft),
          //     child: Text(
          //       "Sign up. ",
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     )),
        ],
      )
    ]));
  }
}
