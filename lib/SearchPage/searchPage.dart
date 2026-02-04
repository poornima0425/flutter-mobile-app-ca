import 'package:flutter/material.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeOne.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeTwo.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeThree.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFour.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeFive.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeSix.dart';
//import 'package:mobile_app_ca/TravelPlaceDetails/placeSeven.dart';
import 'package:mobile_app_ca/TravelPlaceDetails/placeEight.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> places = [
    {
      "title": "Idalgashinna",
      "image": "assets/t13.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$48"
    },
    {
      "title": "Nuwara Eliya",
      "image": "assets/t8.jpg",
      "location": "Central Province, Sri Lanka",
      "price": "\$36"
    },
    {
      "title": "Yala National Park",
      "image": "assets/t10.jpg",
      "location": "Southern Province, Sri Lanka",
      "price": "\$42"
    },
    {
      "title": "Sigiriya",
      "image": "assets/t11.jpg",
      "location": "Matale, Sri Lanka",
      "price": "\$50"
    },
    {
      "title": "Ohiya",
      "image": "assets/t12.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$40"
    },
    {
      "title": "Diyaluma Waterfall",
      "image": "assets/t7.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$35"
    },
    {
      "title": "Galle Beach",
      "image": "assets/G_beach4.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$35"
    },
     {
      "title": "Unawatuna Beach",
      "image": "assets/img45.jpg",
      "location": "Badulla, Sri Lanka",
      "price": "\$35"
    },
  ];

  List<Map<String, dynamic>> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = places;
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlaces = places;
      } else {
        filteredPlaces = places
            .where((place) =>
                place["title"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget navigateToPage(String title, ImageProvider image) {
    if (title == "Idalgashinna") return Placeone(title: title, image: image);
    if (title == "Nuwara Eliya") return PlaceTwo(title: title, image: image);
    if (title == "Yala National Park") return PlaceThree(title: title, image: image);
    if (title == "Sigiriya") return PlaceFour(title: title, image: image);
    if (title == "Ohiya") return PlaceFive(title: title, image: image);
    //if (title == "Galle Beach") return PlaceSeven(title: title, image: image);
    if (title == "Unawatuna Beach") return PlaceEight(title: title, image: image);
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
            children: [
              const Text(
                "Search",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: filterSearch,
                decoration: InputDecoration(
                  hintText: "Search places...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredPlaces.length,
                  itemBuilder: (context, index) {
                    var place = filteredPlaces[index];
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
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(12),
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
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                place["image"],
                                width: 110,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place["title"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          place["location"],
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              place["price"],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
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
        ),
      ),
    );
  }
}
