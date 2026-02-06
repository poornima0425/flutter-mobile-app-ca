import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NatureLoversPage extends StatelessWidget {
  const NatureLoversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz, color: Colors.black),
          )
        ],
        title: const Text(
          "Discover Waterfalls",
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
              "Top 10 Beautiful Waterfalls in Sri Lanka",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // 1
            NatureSpotCard(
              image: const AssetImage("assets/img35.jpg"),
              title: "Bomburu waterfall",
              description: "Bomburu Ella is one of the most breathtaking waterfallbin Sri Lanka.",
              rating: "4.9",
              onTap: () {},
            ),

            // 2
            NatureSpotCard(
              image: const AssetImage("assets/img36.jpg"),
              title: "Bambarakanda Falls",
              description: "The tallest waterfall in Sri Lanka. A must visit.",
              rating: "4.8",
              onTap: () {},
            ),

            // 3
            NatureSpotCard(
              image: const AssetImage("assets/img37.jpg"),
              title: "Ravana Falls - Ella",
              description: "Popular waterfall near Ella caves and forests.",
              rating: "4.7",
              onTap: () {},
            ),

            // 4
            NatureSpotCard(
              image: const AssetImage("assets/img38.jpg"),
              title: "Dunhinda Falls",
              description: "Famous smoky waterfall located in Badulla.",
              rating: "4.9",
              onTap: () {},
            ),

            // 5
            NatureSpotCard(
              image: const AssetImage("assets/img39.jpg"),
              title: "Bopath Ella",
              description: "Shaped like a Bo leaf. Located in Ratnapura.",
              rating: "4.8",
              onTap: () {},
            ),

            // 6
            NatureSpotCard(
              image: const AssetImage("assets/img40.jpg"),
              title: "Laxapana Falls",
              description: "A tall waterfall surrounded by lush greenery.",
              rating: "4.7",
              onTap: () {},
            ),

            // 7
            NatureSpotCard(
              image: const AssetImage("assets/img41.jpg"),
              title: "St. Clair’s Falls",
              description: "Known as the ‘Little Niagara of Sri Lanka’.",
              rating: "4.8",
              onTap: () {},
            ),

            // 8
            NatureSpotCard(
              image: const AssetImage("assets/img42.jpg"),
              title: "Devon Falls",
              description: "Beautiful cascading waterfall near Hatton.",
              rating: "4.7",
              onTap: () {},
            ),

            // 9
            NatureSpotCard(
              image: const AssetImage("assets/img43.jpg"),
              title: "Aberdeen Falls",
              description: "A hidden gem with a deep natural pool.",
              rating: "4.8",
              onTap: () {},
            ),

            // 10
            NatureSpotCard(
              image: const AssetImage("assets/img44.jpg"),
              title: "Kirindi Ella",
              description: "Tall elegant waterfall located in Pelmadulla.",
              rating: "4.6",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ CARD DESIGN ------------------

class NatureSpotCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String rating;
  final VoidCallback onTap;

  const NatureSpotCard({
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


