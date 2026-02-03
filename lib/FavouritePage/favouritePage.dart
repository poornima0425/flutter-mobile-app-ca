import 'package:flutter/material.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeOne.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeTwo.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeThree.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFour.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFive.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeSix.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});

  final List<Map<String, dynamic>> favoritePlaces = [
    {
      "title": "Nuwara Eliya",
      "image": "assets/t8.jpg",
      "location": "Central Province, Sri Lanka",
      "price": "\$36"
    },
    {
      "title": "Sigiriya",
      "image": "assets/t11.jpg",
      "location": "Matale, Sri Lanka",
      "price": "\$50"
    },
    {
      "title": "Yala National Park",
      "image": "assets/t10.jpg",
      "location": "Southern Province, Sri Lanka",
      "price": "\$42"
    },
    {
      "title": "Ohiya",
      "image": "assets/t12.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$30"
    },
    {
      "title": "Diyaluma Waterfall",
      "image": "assets/t7.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$25"
    },
  ];

  Widget navigateToPage(String title, ImageProvider image) {
    if (title == "Idalgashinna") return Placeone(title: title, image: image);
    if (title == "Nuwara Eliya") return PlaceTwo(title: title, image: image);
    if (title == "Yala National Park") return PlaceThree(title: title, image: image);
    if (title == "Sigiriya") return PlaceFour(title: title, image: image);
    if (title == "Ohiya") return PlaceFive(title: title, image: image);
    return PlaceSix(title: title, image: image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Favorites",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Grid of favorite places
              Expanded(
                child: GridView.builder(
                  itemCount: favoritePlaces.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75, // square-like card
                  ),
                  itemBuilder: (context, index) {
                    var place = favoritePlaces[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => navigateToPage(
                              place["title"],
                              AssetImage(place["image"]),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Place Image
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              child: Image.asset(
                                place["image"],
                                height: 110,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place["title"],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          place["location"],
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    place["price"],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}