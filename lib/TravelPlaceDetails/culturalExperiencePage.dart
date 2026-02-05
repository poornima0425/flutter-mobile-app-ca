import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CulturalExperiencePage extends StatelessWidget {
  const CulturalExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cultureList = [
      {"name": "Kandy Perahera", "image": "assets/img19.jpg"},
      {"name": "Sigiriya Frescoes", "image": "assets/img20.jpg"},
      {"name": "Galle Fort", "image": "assets/img21.jpg"},
      {"name": "Sri Dalada Maligawa", "image": "assets/img22.jpg"},
      {"name": "Anuradhapura Ruins", "image": "assets/img23.jpg"},
      {"name": "Polonnaruwa Statues", "image": "assets/img24.jpg"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),

      // ----------------- APP BAR -----------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Cultural Experience",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ----------------- BODY -----------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: cultureList
              .map(
                (item) => CulturalSpotCard(
                  image: AssetImage(item["image"]!),
                  title: item["name"]!,
                  description: "Sri Lankan cultural heritage site",
                  rating: "4.7",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CulturalDetailsPage(
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
// CARD DESIGN (MATCHING ADVENTURE + BUDGET DESIGN)
// ---------------------------------------------------------
class CulturalSpotCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String rating;
  final VoidCallback onTap;

  const CulturalSpotCard({
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
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
class CulturalDetailsPage extends StatelessWidget {
  final String name;
  final String image;

  const CulturalDetailsPage({
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
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "$name is one of the most iconic cultural experiences in Sri Lanka, showcasing the island's rich heritage.",
              style: GoogleFonts.poppins(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
