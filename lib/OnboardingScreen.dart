import 'package:flutter/material.dart';
import 'package:kub_test/onboardingPage.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            title: 'Bienvenue chez Kub!',
            description: 'Kub vous offre une expérience de transport de qualité.',
            imagePath: 'assets/welcome.png',
          ),
          OnboardingPage(
            title: 'Inscrivez-vous ou Connectez-vous',
            description: 'Créez un compte en quelques étapes simples ou connectez-vous.',
            imagePath: 'assets/register.png',
          ),
          // Ajoutez d'autres pages d'onboarding ici
        ],
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            // Naviguer à la page suivante ou à la page d'accueil
            if (_pageController.page == 2) {
              // Navigate to home screen
            } else {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          child: const Text(
            'Suivant',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
