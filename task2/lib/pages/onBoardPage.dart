import 'package:flutter/material.dart';
import 'package:task2/style/colors.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(color: backgroundDarkSecond),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.fingerprint_rounded,
                    color: backgroundLight,
                    size: 120,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Sign in with touch ID",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Use your touch ID for faster, easier\n access to your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: screen.width * .8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              padding: const EdgeInsets.all(20),
                              primary: backgroundLight),
                          onPressed: () {},
                          child: Text(
                            "Login With Email",
                            style: TextStyle(
                                color: backgroundDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "New User? Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 74,
                  ),
                  Text(
                    "Help?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: backgroundLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
