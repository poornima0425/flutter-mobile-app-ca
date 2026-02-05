import 'package:flutter/material.dart';
import 'package:mobile_app_ca/BudgetCalPage/budgetCalculatorPage.dart';
import 'package:mobile_app_ca/CurrencyConverterPage/currencyConverterPage.dart';
import 'package:mobile_app_ca/DistanceTimeCalPage/distanceTimeCalculatorPage.dart';
import 'package:mobile_app_ca/FuelCostEstimatorPage/fuelCostEstimatorPage.dart';
import 'package:mobile_app_ca/HotelStayCostPage/hotelStayCostPage.dart';
import 'package:mobile_app_ca/NatureTipsPage/natureTipsPage.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ItineraryPlannerPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// MAIN ITINERARY PAGE
class ItineraryPlannerPage extends StatelessWidget {
  const ItineraryPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Itinerary Planner"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//Popular Itineraries
              const Text(
                "Popular Itineraries",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ItineraryCard(
                      image: AssetImage("assets/t21.jpg"),
                      name: "3-Day Nuwara Eliya Trip",
                      duration: "3 Days",
                      places: "Tea Gardens, Gregory Lake",
                    ),
                    ItineraryCard(
                      image: AssetImage("assets/img50.jpg"),
                      name: "Weekend Colombo Tour",
                      duration: "2 Days",
                      places: "Galle Face, Dutch Hospital, Pettah",
                    ),
                    ItineraryCard(
                      image: AssetImage("assets/img51.jpg"),
                      name: "Cultural Triangle",
                      duration: "4 Days",
                      places: "Sigiriya, Dambulla, Polonnaruwa",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

//Trip Categories
              const Text(
                "Trip Categories",
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
//Nature Trips Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NatureTipsPage(),
                        ),
                      );
                    },
                    child: const ItineraryCategoryCard(
                      title: "Nature Trips",
                      icon: Icons.nature,
                    ),
                  ),

//Budget Calculator Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BudgetCalculatorPage(),
                        ),
                      );
                    },
                    child: const ItineraryCategoryCard(
                      title: "Budget Calculator",
                      icon: Icons.calculate,
                    ),
                  ),

//Distance & Travel Time Calculator Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DistanceTimeCalculatorPage(),
                        ),
                      );
                    },
                    child: const ItineraryCategoryCard(
                      title: "Distance & Time",
                      icon: Icons.directions_car,
                    ),
                  ),

//Currency Converter Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CurrencyConverterPage(),
                        ),
                      );
                    },
                    child: const ItineraryCategoryCard(
                      title: "Currency Converter",
                      icon: Icons.currency_bitcoin,
                    ),
                  ),

                  // Fuel Cost Estimator Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Fuelcostestimatorpage(),
                        ),
                      );
                    },
                    child: const ItineraryCategoryCard(
                      title: "Fuel Cost Estimator",
                      icon: Icons.local_gas_station,
                    ),
                  ),

                  // Hotel Stay Cost Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Hotelstaycostpage(),
                        ),
                      );
                    },
                    child: const ItineraryCategoryCard(
                      title: "Hotel Stay Cost",
                      icon: Icons.hotel,
                    ),
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

//ITINERARY CARD 
class ItineraryCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String duration;
  final String places;

  const ItineraryCard({
    super.key,
    required this.image,
    required this.name,
    required this.duration,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
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
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              duration,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              places,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

//CATEGORY CARD
class ItineraryCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ItineraryCategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

