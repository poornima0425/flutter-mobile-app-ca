import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RomanticDestinationsPage extends StatelessWidget {
  const RomanticDestinationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> romanticPlaces = [
      {"name": "Nuwara Eliya", "image": "assets/t24.jpg"},
      {"name": "Bentota Beach", "image": "assets/img31.jpg"},
      {"name": "Mirissa", "image": "assets/m_beach4.jpg"},
      {"name": "Edison Bungalow", "image": "assets/img32.jpg"},
      {"name": "Nine Arch Bridge", "image": "assets/img33.jpg"},
      {"name": "Colombo", "image": "assets/img34.jpg"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),

      // ---------------- TOP APP BAR ----------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Romantic Destinations",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: romanticPlaces
              .map(
                (item) => RomanticSpotCard(
                  image: AssetImage(item["image"]!),
                  title: item["name"]!,
                  description: "Perfect romantic getaway for couples",
                  rating: "4.8",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RomanticDetailsPage(
                          name: item["name"]!,
                          image: item["image"]!,
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// CARD DESIGN (same as adventure, budget, culture)
// ---------------------------------------------------------
class RomanticSpotCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String rating;
  final VoidCallback onTap;

  const RomanticSpotCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image(
                image: image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // TEXT
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pink, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
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

// ---------------------------------------------------------
// DETAILS PAGE
// ---------------------------------------------------------
class RomanticDetailsPage extends StatelessWidget {
  final String name;
  final String image;

  const RomanticDetailsPage({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          name,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Image.asset(
            image,
            height: 260,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "$name is one of the most romantic and peaceful destinations in Sri Lanka, perfect for couples.",
              style: GoogleFonts.poppins(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
