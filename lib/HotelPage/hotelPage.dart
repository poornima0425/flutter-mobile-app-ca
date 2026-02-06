import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Hotels in Sri Lanka"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Featured Hotels",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HotelCard(
                      image: const AssetImage("assets/img47.jpg"),
                      name: "Jetwing Blue",
                      rating: "4.8",
                      location: "Negombo",
                      contact: "+94 31 123 4567",
                    ),
                    HotelCard(
                      image: const AssetImage("assets/img48.jpg"),
                      name: "Heritance Kandalama",
                      rating: "4.7",
                      location: "Dambulla",
                      contact: "+94 66 123 4567",
                    ),
                    HotelCard(
                      image: const AssetImage("assets/img49.jpg"),
                      name: "Shangri-La Colombo",
                      rating: "4.6",
                      location: "Colombo",
                      contact: "+94 11 123 4567",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                  HotelCategoryCard(
                    title: "Luxury Hotels",
                    icon: Icons.hotel,
                    hotels: [
                      {"name": "Cinnamon Grand", "location": "Colombo", "contact": "+94 11 765 4321"},
                      {"name": "Taj Samudra", "location": "Colombo", "contact": "+94 11 234 5678"},
                    ],
                  ),
                  HotelCategoryCard(
                    title: "Budget Hotels",
                    icon: Icons.money,
                    hotels: [
                      {"name": "City Rest", "location": "Kandy", "contact": "+94 81 123 4567"},
                      {"name": "Green Inn", "location": "Galle", "contact": "+94 91 234 5678"},
                    ],
                  ),
                  HotelCategoryCard(
                    title: "Nature Retreats",
                    icon: Icons.nature,
                    hotels: [
                      {"name": "Jetwing Vil Uyana", "location": "Sigiriya", "contact": "+94 66 345 6789"},
                    ],
                  ),
                  HotelCategoryCard(
                    title: "City Hotels",
                    icon: Icons.location_city,
                    hotels: [
                      {"name": "Movenpick Colombo", "location": "Colombo", "contact": "+94 11 456 7890"},
                    ],
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

// -----------------------------------------------------------
// HOTEL CARD (Horizontal Scroll)
// -----------------------------------------------------------
class HotelCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String rating;
  final String location;
  final String contact;

  const HotelCard({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.location,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HotelDetailPage(
                hotels: [
                  {"name": name, "location": location, "contact": contact},
                ],
              ),
            ));
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
                name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(rating, style: const TextStyle(color: Colors.white)),
                ],
              ),
              Text(
                location,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------
// HOTEL CATEGORY CARD (Grid)
// -----------------------------------------------------------
class HotelCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Map<String, String>> hotels;

  const HotelCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.hotels,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HotelDetailPage(hotels: hotels)));
      },
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

// -----------------------------------------------------------
// HOTEL DETAIL PAGE
// -----------------------------------------------------------
class HotelDetailPage extends StatelessWidget {
  final List<Map<String, String>> hotels;
  const HotelDetailPage({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Details"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.hotel, color: Colors.blue),
              title: Text(hotel["name"]!),
              subtitle: Text("${hotel["location"]}\nContact: ${hotel["contact"]}"),
            ),
          );
        },
      ),
    );
  }
}