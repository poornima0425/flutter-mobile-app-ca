import 'package:flutter/material.dart';

class PlaceFive extends StatelessWidget {
  const PlaceFive({
    super.key,
    required String title,
    required ImageProvider<Object> image,
  });

  // ---- ADD THIS LIST OF 4 IMAGES ----
  final List<String> previewImages = const [
    "assets/t45.jpeg",
    "assets/t39.jpg",
    "assets/t49.jpeg",
    "assets/t52.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -------- IMAGE HEADER --------
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
                      image: AssetImage("assets/t40.jpeg"),
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
                        "Ohiya",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$48",
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
                      Text("Uva Province", style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Text(
                    "Ohiya is a quiet rural village in the Badulla District of Sri Lanka. "
                    "It is located in the Uva Province and is well known as one of the closest "
                    "entrance points to Horton Plains National Park. The village sits at a high "
                    "elevation surrounded by forests, cool climate, and misty mountains, making it "
                    "a peaceful destination for nature lovers.\n\n"
                    "Ohiya Railway Station, built in 1893, is the third-highest station in Sri Lanka "
                    "and lies on the Main Line between Colombo and Badulla. The area is famous for "
                    "several attractions such as the Ohiya Gap viewpoint, the Devil’s Staircase trail, "
                    "Ohiya Forest, and Bambarakanda Falls—the tallest waterfall in Sri Lanka. The village "
                    "is also close to popular hiking routes like Kirigalpoththa and Rahangala Mountain.",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 20),

                  // ---------------------------------
                  //         PREVIEW SECTION
                  // ---------------------------------
                  const Text(
                    "Preview",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  // Preview images (UPDATED)
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: previewImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(previewImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Book button
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

  // Icon Button Widget
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
