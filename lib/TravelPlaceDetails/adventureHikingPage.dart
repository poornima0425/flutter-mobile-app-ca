import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdventureHikingPage extends StatelessWidget {
  const AdventureHikingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ],
        title: const Text(
          "Adventure & Hiking",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Explore Sri Lanka's best adventurous hiking destinations",
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
            ),
            const SizedBox(height: 20),

            // Cards List
            AdventureSpotCard(
              image: const AssetImage("assets/img5.jpg"),
              title: "Ella Rock",
              description: "A scenic mountain trail with stunning viewpoints.",
              rating: "4.8",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img6.jpg"),
              title: "Knuckles Mountain Range",
              description: "Perfect for long hikes and nature photography.",
              rating: "4.7",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img7.jpg"),
              title: "Horton Plains",
              description: "Home to World's End and breathtaking landscapes.",
              rating: "4.9",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img8.jpg"),
              title: "Adam's Peak",
              description: "Iconic pilgrimage trail with sunrise views.",
              rating: "4.6",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img9.jpg"),
              title: "Hanthana Mountain Range",
              description: "Easy to moderate trails for all hikers.",
              rating: "4.5",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img10.jpg"),
              title: "Belihuloya Trail",
              description: "Perfect for eco-adventures and river trekking.",
              rating: "4.6",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img11.jpg"),
              title: "Alagalla Mountain",
              description: "Steep climbs and incredible summit views.",
              rating: "4.7",
              onTap: () {},
            ),

            AdventureSpotCard(
              image: const AssetImage("assets/img12.jpg"),
              title: "Little Adam's Peak",
              description: "Short, easy hike with beautiful photo spots.",
              rating: "4.8",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}


// ------------------------- CARD DESIGN -------------------------

class AdventureSpotCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String rating;
  final VoidCallback onTap;

  const AdventureSpotCard({
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
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image(
                image: image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

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
                          fontWeight: FontWeight.w500,
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
