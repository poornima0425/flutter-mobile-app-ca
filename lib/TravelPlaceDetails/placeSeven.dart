import 'package:flutter/material.dart';

class PlaceSeven extends StatelessWidget {
  const PlaceSeven({ super.key,
    required String title,
    required ImageProvider<Object> image,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -------- HEADER IMAGE --------
            Stack(
              children: [
                Container(
                  height: 320,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/G_beach2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Back button
                Positioned(
                  top: 40,
                  left: 20,
                  child: _iconButton(Icons.arrow_back),
                ),

                // Favorite button
                Positioned(
                  top: 40,
                  right: 20,
                  child: _iconButton(Icons.favorite_border),
                ),
              ],
            ),

            // -------- DETAILS CARD --------
            Container(
              transform: Matrix4.translationValues(0, -30, 0),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Galle Beach",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$35",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " /person",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Location
                  Row(
                    children: const [
                      Icon(Icons.location_on, size: 16, color: Colors.blue),
                      SizedBox(width: 4),
                      Text("Galle, Southern Province",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // ---- DESCRIPTION ----
                  Text(
                    "Galle Beach is one of the most peaceful coastal areas in Sri Lanka, "
                    "famous for its golden sand, clear blue waters, and calm relaxing atmosphere. "
                    "Located near the historic Galle Fort, the beach attracts travelers for its "
                    "sunsets, photography spots, and ocean breeze.\n\n"
                    "Visitors can walk along the seaside, explore the Dutch fort walls, enjoy "
                    "local food stalls, or simply relax in the warm sunlight. "
                    "Galle Beach is a perfect destination for families, couples, and solo travelers "
                    "who want to experience the charm of the southern coast.",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 20),

                  

                  // ---- BOOK NOW BUTTON ----
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Book Now",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Icon Button
  Widget _iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }
}