import 'package:flutter/material.dart';
import 'package:karnaphuli_new/screens/homeScreen.dart';
import 'package:karnaphuli_new/screens/splashScreen.dart';

void main() {
  runApp(
    const KarnaphuliApp(),
  );
}

class KarnaphuliApp extends StatelessWidget {
  const KarnaphuliApp({
    super.key,
  });
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeScreen: (_) => const SplashScreen(),
        HomeScreen.routeScreen: (_) => const HomeScreen(),
      },
    );
  }
}
