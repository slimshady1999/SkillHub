import "package:flutter/material.dart";
import "package:videovortex/screens/auth_screen/signup.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ),
              );
            },
            child: const Text(
              "Just a text",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
