import 'package:bet/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 214,
          height: 35,
          child: Text(
            'Welcome!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontFamily: 'Didact Gothic',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
        ),
      ],
    );
  }

}

class BetterEatThatLogo extends StatelessWidget {
  const BetterEatThatLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(
              'assets/BetterEatThat.png'
          ),
        ],
      );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 326,
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0xFFF9F7FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26452A7C),
              blurRadius: 30,
              offset: Offset(0, 30),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/google.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const SizedBox(
              width: 218,
              height: 25,
              child: Text(
                'Continue with Google',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Didact Gothic',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _HomeState extends State<Home> {

  Future<void> signInWithGoogle() async {
    //Create an instance of the firebase auth and google sign in
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //Sign in the user with credentials
    final UserCredential userCredential = await auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF72FF80), Color(0xFFC5FFD5), Color(0xFFB6D3FD)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WelcomeText(),
            const BetterEatThatLogo(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GoogleSignInButton(
                onPressed: () async {
                  //Google Sign in
                  await signInWithGoogle();
                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
