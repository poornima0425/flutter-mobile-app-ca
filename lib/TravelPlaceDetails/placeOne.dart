
import 'package:flutter/material.dart';

class Placeone extends StatelessWidget {
  const Placeone({
    super.key,
    required String title,
    required ImageProvider<Object> image,
  });

  // ---- ADD THIS LIST OF 4 IMAGES ----
  final List<String> previewImages = const [
    "assets/t15.jpeg",
    "assets/t14.jpeg",
    "assets/t19.jpeg",
    "assets/t20.jpeg",
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
                      image: AssetImage("assets/t16.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Back button
                Positioned(
                  top: 40,
                  left: 20,
                  child: _iconButton( Icons.arrow_back),
                ),

                // Favorite button
                Positioned(
                  top: 40,
                  right: 20,
                  child: _iconButton1(Icons.favorite_border),
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
                        "Idalgashinna",
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
                      Text(
                        "Haputale",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Description
                  Text(
                    "Idalgashinna is a beautiful mountain village in the Badulla District of Sri Lanka. "
                    "It sits at a high elevation and is well known for its calm environment, tea estates, "
                    "and stunning railway views. The village lies between Haputale and Ohiya, making it "
                    "popular among travelers who enjoy cool weather and nature.\n\n"
                    "The area is also close to the Thangamale Bird Sanctuary, which adds to its natural "
                    "beauty. Idalgashinna has a long history connected with tea cultivation, and its "
                    "mountain pass was once an important route during ancient times. Today, it is a "
                    "peaceful place with schools and small communities living around the estate.",
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
Widget _iconButton1(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }

  // UPDATED Icon Button (BACK WORKS)
  Widget_iconButton(BuildContext context, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); 
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon),
      ),
    );
  }
}