import 'package:flutter/cupertino.dart';
import 'package:karnaphuli_new/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeScreen = "./splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    try {
      // Delaying User login to fetch all the data.
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.of(
            context,
          ).pushReplacementNamed(
            HomeScreen.routeScreen,
          );
        },
      );
    } catch (error) {
      print(
        "Here an error occured!",
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(
          0xFF172027,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const CupertinoActivityIndicator(
              radius: 20.0,
              color: Color(
                0xffF79520,
              ),
            )
          ],
        ),
      ),
    );
  }
}
