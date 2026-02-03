import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilyTripsPage extends StatelessWidget {
  const FamilyTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF), // same light blue background
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
          "Best Family Trips",
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
              "Family-friendly destinations in Sri Lanka",
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
            ),
            const SizedBox(height: 20),

            // Cards
            FamilySpotCard(
              image: const AssetImage("assets/elephant1.jpg"),
              title: "Pinnawala Elephant Orphanage",
              description: "Spend time with elephants and enjoy nature.",
              rating: "4.7",
              onTap: () {},
            ),

            FamilySpotCard(
              image: const AssetImage("assets/img1.jpg"),
              title: "Peradeniya Botanical Garden",
              description: "Perfect for a relaxing walk with family.",
              rating: "4.8",
              onTap: () {},
            ),

            FamilySpotCard(
              image: const AssetImage("assets/img2.jpg"),
              title: "Galle Fort",
              description: "A historical place with beautiful scenery.",
              rating: "4.6",
              onTap: () {},
            ),

            FamilySpotCard(
              image: const AssetImage("assets/img3.jpg"),
              title: "Udawalawe Safari Park",
              description: "Enjoy a wildlife safari with kids.",
              rating: "4.9",
              onTap: () {},
            ),

            FamilySpotCard(
              image: const AssetImage("assets/img4.jpg"),
              title: "Seethawaka Botanical Garden",
              description: "Peaceful garden with lush greenery.",
              rating: "4.7",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ CARD STYLE (Same as NatureSpotCard) ------------------

class FamilySpotCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String rating;
  final VoidCallback onTap;

  const FamilySpotCard({
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image(
                image: image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Text Area
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