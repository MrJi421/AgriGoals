import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart'; // Import flutter_icons package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';




// import 'package:flutter/material.dart';
// Import statements...

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

//splash screen not used yet
class CodiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 800,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -6,
              width: 378,
              top: 0,
              height: 819,
              child: Image.asset(
                'lib',
                width: 378,
                height: 819,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: -16,
              width: 376,
              top: 0,
              height: 811,
              child: Image.asset(
                'lib/assets/splash_logo.png',
                width: 376,
                height: 811,
              ),
            ),
            Positioned(
              left: 22,
              right: 20,
              top: 249,
              height: 320,
              child: Image.asset(
                'lib/assets/splash_logo.png',
                height: 320,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//login page
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
              height: 150,
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
                labelText: 'Phone No.',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'OTP',
              ),
            ),

            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign in button press
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF613EEA),
                fixedSize: const Size(200, 50),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle sign in with Google
                  },
                  icon: const Icon(FontAwesomeIcons.google),
                ),
                IconButton(
                  onPressed: () {
                    // Handle sign in with Facebook
                  },
                  icon: const Icon(FontAwesomeIcons.facebook),
                ),
                IconButton(
                  onPressed: () {
                    // Handle sign in with Twitter
                  },
                  icon: const Icon(FontAwesomeIcons.twitter),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to AgriGoals? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the signup page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//signup page

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone No.',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'OTP',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF613EEA),
                fixedSize: const Size(200, 50),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Or sign up with',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle sign up with Google
                  },
                  icon: const Icon(FontAwesomeIcons.google),
                ),
                IconButton(
                  onPressed: () {
                    // Handle sign up with Facebook
                  },
                  icon: const Icon(FontAwesomeIcons.facebook),
                ),
                IconButton(
                  onPressed: () {
                    // Handle sign up with Twitter
                  },
                  icon: const Icon(FontAwesomeIcons.twitter),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already signed up? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the signin page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//home section
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('AgriGoals'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button tap
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // drawer items 
            ListTile(
          title: Text(
            'Weather',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            // Navigate to the WeatherPage when 'Weather' option is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeatherPage()),
            );
          },
        ),
            ListTile(
              title: Text('Soil Health',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle soil health item tap
              },
            ),
            ListTile(
              title: Text('Crop Management',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle crop management item tap
              },
            ),
            ListTile(
              title: Text('Market Trends',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle market trends item tap
              },
            ),
            ListTile(
              title: Text('Sustainable Practices',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle sustainable practices item tap
              },
            ),
            ListTile(
              title: Text('Innovation',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle innovation item tap
              },
            ),
            ListTile(
              title: Text('Chatbot',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle chatbot item tap
              },
            ),
            ListTile(
              title: Text('Feedback',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle feedback item tap
              },
            ),
            ListTile(
              title: Text('Policies',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle policies item tap
              },
            ),
            ListTile(
              title: Text('Logout',
              style: TextStyle(
                color: Color.fromARGB(255, 223, 15, 0),
                fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                // Handle policies item tap
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section 1: Weather Forecast
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weather Forecast',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add weather forecast widget here (e.g., fetched from an API)
                ],
              ),
            ),
            // Section 2: Latest News in Agriculture
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest News in Agriculture',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add latest news widget here (e.g., fetched from an API)
                ],
              ),
            ),
            // Section 3: Events and Workshops
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Events and Workshops',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add events and workshops widget here (e.g., fetched from an API)
                ],
              ),
            ),
            // Section 4: Blogs
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blogs',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add blogs widget here (e.g., fetched from an API)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle bottom navigation item tap
        },
      ),
    );
  }
}



//WeatherPage
class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Future<dynamic> _weatherData = Future.value(null); // Initialize with a non-null value

  @override
  void initState() {
    super.initState();
    fetchWeatherData(); // Fetch weather data for the fixed location on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            FutureBuilder(
              future: _weatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // Display weather data
                  final weatherData = snapshot.data;
                  return WeatherWidget(weatherData: weatherData);
                }
              },
            ),
            SizedBox(height: 20),
            // Add more UI elements here as needed
          ],
        ),
      ),
    );
  }

  Future<void> fetchWeatherData() async {
    try {
      // Get weather data for Kothanur, Bengaluru, Karnataka 560077
      final apiKey = 'e76acd81f5b9475cbd0191633241102';
      final apiUrl =
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=Kothanur,Bengaluru,Karnataka,560077'; // Fixed location
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          _weatherData = Future.value(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to fetch weather data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching weather data: $error');
    }
  }
}

class WeatherWidget extends StatelessWidget {
  final dynamic weatherData;

  WeatherWidget({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    if (weatherData == null) {
      return Container(); // Return an empty container if weather data is not available yet
    }

    final current = weatherData['current'];
    final location = weatherData['location']['name'];
    final tempC = current['temp_c'];
    final condition = current['condition']['text'];
    final wind = current['wind_kph'];
    final humidity = current['humidity'];
    final uv = current['uv'];
    final visibility = current['vis_km'];
    final airPressure = current['pressure_mb'];
    final dateTime = DateTime.parse(current['last_updated']);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Location: $location',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temperature: $tempC°C',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Condition: $condition',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Wind: $wind kph',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Humidity: $humidity%',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'UV Index: $uv',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Visibility: $visibility km',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Air Pressure: $airPressure mb',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.wb_sunny), // Use appropriate icons here
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Last Updated: ${DateFormat('MMMM dd, yyyy hh:mm a').format(dateTime)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Next 7 Days Weather',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Add widgets to display next 7 days' weather data here
              ],
            ),
          ),
        ),
      ],
    );
  }
}
