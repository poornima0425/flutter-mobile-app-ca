import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBeachesPage extends StatelessWidget {
  const TopBeachesPage({super.key});

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
          ),
        ],
        title: const Text(
          "Discover Top Beaches",
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
            // Subtitle
            const Text(
              "More than 10 beautiful nature destinations",
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
            ),
            SizedBox(height: 20),
            NatureSpotCard(
              image: AssetImage("assets/G_beach1.jpg"),
              title: "Galle Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/u_beach1.jpg"),
              title: "Unawatuna Beach",
              description: "Relax on golden sands and clear waters.",
              rating: "4.7",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/m_beach1.jpg"),
              title: "Mirissa Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/beach8.jpg"),
              title: "Hikkaduwa Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/a_beach2.jpg"),
              title: "Arugam bay Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/o_beach1.jpg"),
              title: "Oluvil Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/t_beach4.jpg"),
              title: "Trincomalee Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/k_beach1.jpg"),
              title: "Koggala Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
              NatureSpotCard(
              image: AssetImage("assets/casuarina_beach2.jpg"),
              title: "Casuarina Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            
            NatureSpotCard(
              image: AssetImage("assets/thalpe_beach4.jpg"),
              title: "Thalpe Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/pasikuda_beach1.jpg"),
              title: "Pasikuda Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/batticaloa_beach.jpg"),
              title: "Batticaloa Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
            NatureSpotCard(
              image: AssetImage("assets/nilaveli_beach3.jpg"),
              title: "Nilaveli Beach",
              description: "Famous for whale watching and sunsets.",
              rating: "4.6",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

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
