import 'package:booking/screens/explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var logo = 'assets/images/swift.png';
var loading = 'assets/images/background.jpg';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Explore(),
        ),
      );
    }

    Future.delayed(Duration(seconds: 2), navigateToNextPage);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(loading), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                width: 250,
                height: 250,
              ),

              SpinKitChasingDots(
                  color: Colors.white,
                  size: 40,
                ),
            ],
          ),
        ),
      ),
    );
  }
}