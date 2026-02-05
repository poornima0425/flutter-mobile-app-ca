import 'package:flutter/material.dart';

class NatureTipsPage extends StatelessWidget {
  const NatureTipsPage({super.key});

  final List<String> carouselImages = const [
    "assets/t22.jpg",
    "assets/t29.jpg",
    "assets/t21.jpg",
    "assets/t23.jpg",
    "assets/t32.png",
  ];

  final List<Map<String, String>> tips = const [
    {
      "title": "Tip 1: Stay Hydrated",
      "description":
          "Carry reusable water bottles to keep yourself hydrated during the trip.",
    },
    {
      "title": "Tip 2: Wear Comfortable Shoes",
      "description":
          "Wear proper trekking shoes for better comfort and safety on rough terrains.",
    },
    {
      "title": "Tip 3: Respect Nature",
      "description":
          "Avoid littering and respect wildlife to preserve the natural surroundings.",
    },
    {
      "title": "Tip 4: Check Weather",
      "description":
          "Always check weather conditions before your trip to stay safe.",
    },
    {
      "title": "Tip 5: Eco-Friendly Travel",
      "description":
          "Keep your trip eco-friendly by reducing plastic and using sustainable options.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nature Trip Tips"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Image Carousel
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: carouselImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      carouselImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Tips List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: tips.length,
              itemBuilder: (context, index) {
                final tip = tips[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip["title"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tip["description"]!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
