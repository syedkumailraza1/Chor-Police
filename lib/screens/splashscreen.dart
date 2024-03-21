import 'package:flappy_bird_game/game/assets.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'), // Replace with your background image asset
            fit: BoxFit.cover, // Adjust as needed (e.g., BoxFit.fill, BoxFit.contain)
          ),
        ),
        child: Stack( // Use Stack to position elements precisely
          children: [
            
            Align( // Position progress bar at bottom center
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
                child: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.white,
                  size: 60.0, // Adjust size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}