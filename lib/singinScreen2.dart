import 'package:flutter/material.dart';
import 'package:kub_test/constants/colors.dart';

class SignInPage2 extends StatefulWidget {
  @override
  _SignInPage2State createState() => _SignInPage2State();
}

class _SignInPage2State extends State<SignInPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasNewVehicle = false;
  bool _hasLowMileageVehicle = false;
  String? _selectedVehicle;
  final List<String> _vehicleOptions = [
    'Suzuki Dzire',
    'Suzuki Swift',
    'Suzuki S-Presso'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(" "),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Entrez votre nom complet',
                    hintText: 'Entrez votre nom complet',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Entrez votre numéro de téléphone',
                    hintText: 'Entrez votre numéro de téléphone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Entrez votre mot de passe',
                    hintText: 'Entrez votre mot de passe',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              CheckboxListTile(
                title: Text('Posséder un véhicule neuf'),
                value: _hasNewVehicle,
                onChanged: (bool? value) {
                  setState(() {
                    _hasNewVehicle = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Avoir un véhicule ayant un kilométrage de moins de 1500 km au compteur'),
                value: _hasLowMileageVehicle,
                onChanged: (bool? value) {
                  setState(() {
                    _hasLowMileageVehicle = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sélectionnez un véhicule',
                  ),
                  value: _selectedVehicle,
                  items: _vehicleOptions.map((String vehicle) {
                    return DropdownMenuItem<String>(
                      value: vehicle,
                      child: Text(vehicle),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedVehicle = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez sélectionner un véhicule';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 65,
                width: 360,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      child: const Text(
                        'Inscription ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_hasNewVehicle || _hasLowMileageVehicle) {
                            print('Successfully signed up');
                            // Navigate to the next page or perform the signup action
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Vous devez cocher au moins une des options pour être éligible.'),
                              ),
                            );
                          }
                        }
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
                      const Text('Vous avez déjà un compte ? '),
                      InkWell(
                        onTap: () {
                          // Navigate to the login page
                        },
                        child: const Text(
                          'Connectez-vous',
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
      ),
    );
  }
}
