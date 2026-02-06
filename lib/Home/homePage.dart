import 'package:flutter/material.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFive.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFour.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeOne.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeSix.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeThree.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeTwo.dart';
import 'package:mobile_app_ca/FavouritePage/favouritePage.dart';
import 'package:mobile_app_ca/ProfilePage/profilePage.dart';
import 'package:mobile_app_ca/SearchPage/searchPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/natureLoversPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/familyTripsPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/budgetTripsPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/wildlifeSafarisPage.dart';

import 'package:mobile_app_ca/ProfilePage/profilePage.dart';
import 'package:mobile_app_ca/SearchPage/searchPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeOne.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeTwo.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeThree.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFour.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFive.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeSix.dart';
import 'package:mobile_app_ca/FavouritePage/favouritePage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/natureLoversPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/topBeachesPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/familyTripsPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/adventureHikingPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/budgetTripsPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/culturalExperiencePage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/wildlifeSafarisPage.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/romanticDestinationsPage.dart';
import 'package:mobile_app_ca/HotelPage/hotelPage.dart';
import 'package:mobile_app_ca/FoodPage/foodPage.dart';
import 'package:mobile_app_ca/ItineraryPlannerPage/itineraryPlannerPage.dart';



import 'package:mobile_app_ca/ManageBooking/manageBooking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// HOME SCREEN

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // Track which chip is selected
  String selectedChip = "Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.manage_history), label: ""),
        ],
      ),

      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [homeUI(), SearchPage(), FavouritePage(), ProfilePage(), Managebooking()],
        ),
      ),
    );
  }

  // HOME UI

  Widget homeUI() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explore", style: TextStyle(color: Colors.grey)),
                      Text(
                        "Sri Lanka",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "Discover Paradise",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Find things to do",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Chips
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ChipItem(
                      title: "Location",
                      selected: selectedChip == "Location",
                      onTap: () {
                        setState(() {
                          selectedChip = "Location";
                        });
                        // Already on Location, no navigation
                      },
                    ),
                    ChipItem(
                      title: "Hotels",
                      selected: selectedChip == "Hotels",
                      onTap: () {
                        setState(() {
                          selectedChip = "Hotels";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HotelPage(),
                          ),
                        );
                      },
                    ),
                    ChipItem(
                      title: "Food",
                      selected: selectedChip == "Food",
                      onTap: () {
                        setState(() {
                          selectedChip = "Food";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodPage(),
                          ),
                        );
                      },
                    ),
                    ChipItem(
                      title: "Itinerary",
                      selected: selectedChip == "Itinerary",
                      onTap: () {
                        setState(() {
                          selectedChip = "Location";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ItineraryPlannerPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Popular Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Popular",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("See all", style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PlaceCard(
                      image: AssetImage("assets/t13.jpg"),
                      title: "Idalgashinna",
                      rating: "4.5",
                    ),
                    PlaceCard(
                      image: AssetImage("assets/t8.jpg"),
                      title: "Nuwara Eliya",
                      rating: "4.5",
                    ),
                    PlaceCard(
                      image: AssetImage("assets/t10.jpg"),
                      title: "Yala National Park",
                      rating: "4.5",
                    ),
                    PlaceCard(
                      image: AssetImage("assets/t11.jpg"),
                      title: "Sigiriya",
                      rating: "4.5",
                    ),
                    PlaceCard(
                      image: AssetImage("assets/t12.jpg"),
                      title: "Ohiya",
                      rating: "4.5",
                    ),
                    PlaceCard(
                      image: AssetImage("assets/t7.jpg"),
                      title: "Diyaluma Waterfall",
                      rating: "4.5",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Recommended Section
              const Text(
                "Recommended",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  CategoryCard(
                    title: "Top Waterfalls",
                    icon: Icons.nature,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NatureLoversPage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Top Beaches",
                    icon: Icons.beach_access,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TopBeachesPage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Family Trips",
                    icon: Icons.family_restroom,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FamilyTripsPage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Adventure & Hiking",
                    icon: Icons.terrain,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdventureHikingPage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Budget Friendly Trips",
                    icon: Icons.attach_money,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BudgetTripsPage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Cultural Experience",
                    icon: Icons.account_balance,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CulturalExperiencePage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Wildlife Safaris",
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WildlifeSafarisPage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: "Romantic Destinations",
                    icon: Icons.favorite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RomanticDestinationsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// CHIP

class ChipItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const ChipItem({
    super.key,
    required this.title,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

// PLACE CARD

class PlaceCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String rating;

  const PlaceCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Widget page;

        if (title == "Idalgashinna") {
          page = Placeone(title: title, image: image);
        } else if (title == "Nuwara Eliya") {
          page = PlaceTwo(title: title, image: image);
        } else if (title == "Yala National Park") {
          page = PlaceThree(title: title, image: image);
        } else if (title == "Sigiriya") {
          page = PlaceFour(title: title, image: image);
        } else if (title == "Ohiya") {
          page = PlaceFive(title: title, image: image);
        } else {
          page = PlaceSix(title: title, image: image);
        }

        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(rating, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// CATEGORY CARD

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
