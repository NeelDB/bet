import 'package:bet/home.dart';
import 'package:bet/login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String sex = '';
  int age = 0;
  double height = 0.0;
  double weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF72FF80), Color(0xFFC5FFD5), Color(0xFFB6D3FD)],
              ),
            ),
          ),
          // Logo
          Positioned(
            top: 15, // Adjust the top position according to your layout
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/BetterEatThat.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ), // Replace YourLogoWidget with your logo widget
            ),
          ),
          // White Layer
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 350,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white, // Set your content layer color here
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                child: UserForm(),
                ),
              )
          )
        ]
      )
    );
  }
}

class UserForm extends StatelessWidget {
  UserForm({super.key});

  Future<void> logout() async {
    final GoogleSignIn googleSign = GoogleSignIn();
    await googleSign.signOut();
  }

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String sex = '';
  int age = 0;
  double height = 0.0;
  double weight = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'User Form',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Didact Gothic',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Sex',
                  border: OutlineInputBorder(),
                ),
                items: ['Male', 'Female']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your sex';
                  }
                  return null;
                },
                onChanged: (value) {
                  sex = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  age = int.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  height = double.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  weight = double.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_)=> const Home()));
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
