import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart'; // Import flutter_icons package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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
                        color: const Color(0xFF613EEA),
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
                        color: const Color(0xFF613EEA),
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

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                //1st news
                SizedBox(
                    height:
                        10), // Add some space between the title and news item
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/news1.jpg'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                        width: 10), // Add some space between the image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complete devp works in current fiscal: Himachal agriculture minister to dept',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Add some space between headline and description
                          Text(
                            'Agriculture and animal husbandry minister Chander Kumar on Friday instructed the departmental officers to complete the work of all targeted projects of the current financial year at a fast pace.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //2nd news
                SizedBox(
                    height:
                        10), // Add some space between the title and news item
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/news2.jpg'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                        width: 10), // Add some space between the image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Security | Rising Food Insecurity',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Add some space between headline and description
                          Text(
                            ' In real terms, food price inflation exceeded overall inflation in 71% of the 165 countries where data is available.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //3rd news
                SizedBox(
                    height:
                        10), // Add some space between the title and news item
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/news3.jpg'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                        width: 10), // Add some space between the image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fires, drought, and dumping milk made headlines in 2023',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Add some space between headline and description
                          Text(
                            'Here is a look at notable events that impacted agriculture in the U.S. and abroad in 2023.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //4th news
                SizedBox(
                    height:
                        10), // Add some space between the title and news item
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/backgrnd.png'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                        width: 10), // Add some space between the image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delhi weather: Stronger winds likely for couple of days, says IMD',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Add some space between headline and description
                          Text(
                            'Delhi air quality expected to improve to satisfactory as strong winds of 25-35 kmph blow on Wednesday and Thursday, with temperatures',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Section 3: Events and Workshops
          Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 219, 210, 255),
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
                SizedBox(height: 10),
                Container(
                  height: 120, // Set the height of the horizontal list view
                  child: ListView(
                    scrollDirection: Axis.horizontal, // Horizontal scrolling
                    children: [
                      // Add event/workshop items here
                      SizedBox(width: 10), // Add initial padding
                      EventWorkshopItem(
                        imagePath: 'lib/assets/event1.jpg',
                        headline:
                            'Snowfall in Himachal and Jammu and Kashmir disrupts normal life.',
                        description:
                            'Quite cold weather and around 10-50 people died',
                      ),
                      SizedBox(width: 10), // Add space between items
                      EventWorkshopItem(
                        imagePath: 'lib/assets/event2.jpg',
                        headline:
                            'Rainfall in parts of north India intensifies winter chill.',
                        description: 'Everyone drowned in the flood',
                      ),
                      SizedBox(width: 10), // Add space between items
                      EventWorkshopItem(
                        imagePath: 'lib/assets/event3.jpg',
                        headline:
                            'Dense fog at Delhi airport delays over 300 flights.',
                        description:
                            'No cars are moving on borad and everything is stuck',
                      ),
                      SizedBox(width: 10),
                      EventWorkshopItem(
                        imagePath: 'lib/assets/event1.jpg',
                        headline:
                            'An analysis by Chennai Rains says that the North Indian ocean basin has become churning more intense cyclones in the past two decades.',
                        description:
                            'All the chennai rains reached till north indian oceans and it had been a critical condition.',
                      ),
                      SizedBox(width: 10),
                      EventWorkshopItem(
                        imagePath: 'lib/assets/event2.jpg',
                        headline: 'Event 3 Headline',
                        description: 'Description of Event 3',
                      ),
                      SizedBox(width: 10),
                      // Add more event/workshop items as needed
                    ],
                  ),
                ),
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
                SizedBox(
                    height:
                        10), // Add some space between the title and blog items
                Container(
                  height: 200, // Set the height of the ListView
                  child: ListView(
                    scrollDirection: Axis.horizontal, // horizontal scrolling
                    children: [
                      // Add blog items here
                      BlogItem(
                        imagePath: 'lib/assets/blog1.jpg',
                        title: 'Blog Title 1',
                        description: 'Description of Blog 1',
                      ),
                      SizedBox(height: 10), // Add space between items
                      BlogItem(
                        imagePath: 'lib/assets/blog2.jpg',
                        title: 'Blog Title 2',
                        description: 'Description of Blog 2',
                      ),
                      SizedBox(height: 10), // Add space between items
                      BlogItem(
                        imagePath: 'lib/assets/blog3.jpg',
                        title: 'Blog Title 3',
                        description: 'Description of Blog 3',
                      ),
                      // Add more blog items as needed
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Market Place',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market1.jpg',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti1.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market2.png',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti2.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market3.jpg',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti3.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market1.jpg',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti1.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market2.png',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti2.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market3.jpg',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti3.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market1.jpg',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti1.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market2.png',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti2.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/market3.jpg',
                  title: 'Farming Tool',
                  description:
                      'High-quality farming tool for various agricultural tasks.',
                  price: '\$150',
                  rating: 4.5,
                ),
                SizedBox(height: 20),
                MarketItem(
                  imagePath: 'lib/assets/ferti3.jpg',
                  title: 'Organic Fertilizer',
                  description:
                      'Organic fertilizer enriched with essential nutrients for plants.',
                  price: '\$30',
                  rating: 4.2,
                ),
                SizedBox(height: 20),
                // Add more MarketItems here as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final double rating;

  const MarketItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Price: $price',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.star, color: const Color(0xFF613EEA), size: 18),
                  SizedBox(width: 5),
                  Text(
                    '$rating',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ForumPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(20),
            color: const Color(0xFF613EEA), // Header color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to the Agriculture Forum',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Join discussions, connect with experts, and explore the marketplace!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Categories Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // List of categories (Replace with actual category widgets)
                CategoryItem(
                  title: 'General Farming',
                  description: 'Discuss all aspects of farming',
                ),
                CategoryItem(
                  title: 'Crop Management',
                  description: 'Share tips and techniques for crop management',
                ),
                CategoryItem(
                  title: 'Livestock Care',
                  description: 'Discuss animal husbandry practices',
                ),
                // Add more category items as needed
              ],
            ),
          ),
          SizedBox(height: 20),
          // Marketplace Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marketplace',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // List of products for sale (Replace with actual product widgets)
                ProductItem(
                  title: 'Organic Fertilizer',
                  description: 'Premium organic fertilizer for healthy crops',
                  price: '\$50',
                  rating: 4.5,
                ),
                ProductItem(
                  title: 'Tractor Rental Service',
                  description: 'Rent a tractor for your farming needs',
                  price: '\$100 per day',
                  rating: 4.0,
                ),
                // Add more product items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for displaying category item
class CategoryItem extends StatelessWidget {
  final String title;
  final String description;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: () {
          // Navigate to category page
        },
      ),
    );
  }
}

// Widget for displaying product item
class ProductItem extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final double rating;

  const ProductItem({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Price: $price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  'Rating: $rating',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Navigate to product details page
        },
      ),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Other Page3 Content'),
    );
  }
}

// Home section
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriGoals'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button tap
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomePageContent(),
          MarketPageContent(),
          ForumPageContent(),
          ProfilePageContent(),
          // Your page content goes here
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF613EEA),
              ),
              child: Text(
                'AgriGoals',
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
              title: Text(
                'Soil Health',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle soil health item tap
              },
            ),
            ListTile(
              title: Text(
                'Crop Management',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle crop management item tap
              },
            ),
            ListTile(
              title: Text(
                'Market Trends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle market trends item tap
              },
            ),
            ListTile(
              title: Text(
                'Sustainable Practices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle sustainable practices item tap
              },
            ),
            ListTile(
              title: Text(
                'Innovation',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle innovation item tap
              },
            ),
            ListTile(
              title: Text(
                'Chatbot',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle chatbot item tap
              },
            ),
            ListTile(
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle feedback item tap
              },
            ),
            ListTile(
              title: Text(
                'Policies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle policies item tap
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 15, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Handle policies item tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF613EEA),
        unselectedItemColor: Colors.black, // Default item color
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class EventWorkshopItem extends StatelessWidget {
  final String imagePath;
  final String headline;
  final String description;

  EventWorkshopItem({
    required this.imagePath,
    required this.headline,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Set the width of the item
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150, // Set the width of the image
            height: 80, // Set the height of the image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 5),
          Text(
            headline,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  BlogItem(
      {required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// WeatherPage
class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Future<dynamic> _weatherData =
      Future.value(null); // Initialize with a non-null value

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

/// WeatherWidget for weather data fetch and make it visible
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

    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/assets/backgrnd.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Card(
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
                SizedBox(height: 10),
                Text(
                  'Last Updated: ${DateFormat('MMMM dd, yyyy hh:mm a').format(dateTime)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                // NextSevenDaysWidget(forecastData: weatherData['forecast']['forecastday']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// // NextSevenDaysWidget to display the weather forecast for the next 7 days
// class NextSevenDaysWidget extends StatelessWidget {
//   final List<dynamic> forecastData;

//   NextSevenDaysWidget({required this.forecastData});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: forecastData.map((forecast) {
//         final date = DateTime.parse(forecast['date']);
//         final maxTempC = forecast['day']['maxtemp_c'];
//         final minTempC = forecast['day']['mintemp_c'];
//         final condition = forecast['day']['condition']['text'];

//         return Card(
//           elevation: 2,
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   DateFormat('EEEE').format(date), // Display day of the week
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Max Temp: $maxTempC°C',
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                     Text(
//                       'Min Temp: $minTempC°C',
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Condition: $condition',
//                   style: TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

