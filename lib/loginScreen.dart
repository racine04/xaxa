import 'package:flutter/material.dart';
import 'package:kub_test/constants/colors.dart';
import 'package:kub_test/main.dart';
import 'package:kub_test/singinScreen.dart'; 

class LoginPage extends StatefulWidget { 
  @override 
  _LoginPageState createState() => _LoginPageState(); 
} 

class _LoginPageState extends State<LoginPage> { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: Colors.white, 
      appBar: AppBar( 
        title: const Text("Connexion"), 
      ), 
      body: SingleChildScrollView( 
        child: Column( 
          children: <Widget>[ 
            Padding( 
              padding: const EdgeInsets.only(top: 20.0), 
              child: Center( 
                child: Container( 
                  width: 300, 
                  height: 200, 
                  child: Image.asset('assets/Kub08.png')), 
              ), 
            ), 
            const SizedBox(height: 1),
            const Text(
              'Connectez-vous !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Akwaba chez Kub, entrez vos informations pour continuer.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),       
            Padding( 
              padding: EdgeInsets.symmetric(horizontal: 15), 
              child: TextField( 
                decoration: InputDecoration( 
                  border: OutlineInputBorder(),
                  labelText: 'Entrez votre numéro de téléphone', 
                  hintText: 'Entrez votre numéro de téléphone'), 
              ), 
            ), 

            SizedBox( 
              height: 65, 
              width: 360, 
              child: Container( 
                child: Padding( 
                  padding: const EdgeInsets.only(top: 20.0), 
                  child: ElevatedButton( 
                    child: const Text('Connexion', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)), 
                    onPressed: () { 
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
},

                    
                  ), 
                ), 
              ), 
            ), 

            const SizedBox(height: 50), 
            Container( 
              child: Center( 
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    const Text('Vous n’avez pas de compte ? '), 
                    InkWell( 
                      onTap: (){ 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()), // Naviguer vers SignUpScreen
                        );
                      }, 
                      child: const Text(
                        'Inscrivez-vous',
                        style: TextStyle(
                          fontSize: 14,
                          color: tPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), 
                  ], 
                ), 
              ), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}
