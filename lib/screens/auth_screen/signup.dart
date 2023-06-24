import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SignUpScreenTopImage(),
                SignUpForm(),
              ]),
        ),
      ),
    );
  }
}

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: MediaButton(
            title: "Facebook",
            icon: Icons.facebook,
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MediaButton(
            title: "Google",
            icon: Icons.golf_course,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class MediaButton extends StatelessWidget {
  const MediaButton({
    super.key, required this.title, required this.icon, required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/signup.jpeg");
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _hide = true;
  String email = '';
  String name = '';
  String phone = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            AppForm(
              title: 'Enter your full name',
              onChange: (val) {
                setState(() {
                  name = val;
                  print(name);
                });
              },
              validator: (val) {
                if (val!.length < 3) {
                  return 'Enter a valid name';
                }
              },
            ),
            SizedBox(height: 20),
            AppForm(
              title: 'Enter your username',
              onChange: (val) {
                setState(() {
                  name = val;
                  print(name);
                });
              },
              validator: (val) {
                if (val!.length < 3) {
                  return 'Enter a valid name';
                }
              },
            ),
            SizedBox(height: 20),
            AppForm(
              title: 'Enter your email',
              onChange: (val) {
                setState(() {
                  email = val;
                  print(email);
                });
              },
              validator: (String? val) => validateEmail(val),
            ),
            SizedBox(height: 20),
            AppForm(
              title: 'Enter your password',
              obscure: _hide,
              suffixWidget: IconButton(
                onPressed: () {
                  if (_hide == true) {
                    setState(() {
                      _hide = false;
                    });
                  } else {
                    setState(() {
                      _hide = true;
                    });
                  }
                },
                icon: _hide
                    ? Image.asset("assets/icons/hide.png")
                    : Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
              ),
              onChange: (val) {
                setState(() {
                  password = val;
                  print(password);
                });
              },
            ),
            // TextFormField(
            //   keyboardType: TextInputType.emailAddress,
            //   textInputAction: TextInputAction.next,
            //   cursorColor: Colors.black,
            //   onSaved: (email) {},
            //   decoration: const InputDecoration(
            //     hintText: "Your email",
            //     prefixIcon: Padding(
            //       padding: EdgeInsets.all(20),
            //       child: Icon(Icons.person),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: TextFormField(
            //     textInputAction: TextInputAction.done,
            //     obscureText: true,
            //     cursorColor: Colors.black,
            //     decoration: const InputDecoration(
            //       hintText: "Your password",
            //       prefixIcon: Padding(
            //         padding: EdgeInsets.all(20),
            //         child: Icon(Icons.lock),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20 / 2),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign Up".toUpperCase()),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '  Or Sign IN WIth  ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Social(),
            const SizedBox(height: 20),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

String? validateEmail(String? value, {String emptyMessage = ""}) {
  if (value != null) {
    if (value.isEmpty) {
      return emptyEmailField(fieldType: emptyMessage);
    }
    // Regex for email validation
    final regExp = RegExp(emailRegex);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return invalidEmailField;
  } else {
    return null;
  }
}

const String invalidEmailField =
    "Email provided isn\'t valid.Try another email address";

String emptyEmailField({String fieldType = "Email"}) =>
    '$fieldType field cannot be empty!';

const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
    '\\@' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
    '(' +
    '\\.' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
    ')+';

class AppForm extends StatelessWidget {
  const AppForm({
    this.suffixWidget,
    this.controller,
    this.validator,
    this.onChange,
    this.obscure = false,
    this.type,
    Key? key,
    required this.title,
  }) : super(key: key);

  final Widget? suffixWidget;
  final String title;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final ValueChanged? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      cursorColor: Colors.black,
      obscureText: obscure,
      obscuringCharacter: '*',
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 5.0,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.red,
              style: BorderStyle.solid,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey[500]),
        fillColor: Colors.grey.shade200,
        filled: true,
        suffixIcon: suffixWidget,
        //prefixIcon: prefixWidget,
      ),
    );
  }
}
