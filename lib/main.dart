import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart'; // Import flutter_icons package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriGoals',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriGoals'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                  image: AssetImage('lib/assets/logo.png'),
                  height: 200,
                ),
            const SizedBox(height: 20),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(height: 20),
ElevatedButton(
  onPressed: () {
    // Handle sign in button press





  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF613EEA),
    fixedSize: Size(200, 50),// Use backgroundColor instead of primary
  ),
  child: const Text(
    'Sign In',
    style: TextStyle(
      color: Colors.white, // Set text color to white
      fontSize: 25, // Set text size to 18
  ),
),
),

            const SizedBox(height: 20),
            const Text(
              'Or sign in with',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle sign in with Google
                  },
                  icon: const Icon(FontAwesomeIcons.google), // Use FontAwesome.google for Google icon
                ),
                IconButton(
                  onPressed: () {
                    // Handle sign in with Google
                  },
                  icon: const Icon(FontAwesomeIcons.facebook), // Use FontAwesome.google for Google icon
                ),
                IconButton(
                  onPressed: () {
                    // Handle sign in with Twitter
                  },
                  icon: const Icon(FontAwesomeIcons.twitter), // Use FontAwesome.twitter for Twitter icon
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class SignupPage extens StatelessWidget{
  
}