import 'package:flutter/material.dart';
import 'package:mobile_app_ca/ManageBooking/manageBooking.dart';

class PlaceFour extends StatelessWidget {
  const PlaceFour({
    super.key,
    required String title,
    required ImageProvider<Object> image,
  });

  // ---- ADD THIS LIST OF 4 IMAGES ----
  final List<String> previewImages = const [
    "assets/t37.jpg",
    "assets/t36.jpg",
    "assets/t47.jpeg",
    "assets/t33.jpg",
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
                      image: AssetImage("assets/t34.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Back button
                Positioned(
                  top: 40,
                  left: 20,
                  child: _iconButton(context, Icons.arrow_back),
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
                        "Sigiriya",
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
                      Text("Dambulla", style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Text(
                    "Sigiriya, also known as Lion Rock, is an ancient rock fortress located near Dambulla in Sri Lanka’s Central Province. "
                    "The massive granite rock rises about 180 meters above the ground and is one of the most important historical and "
                    "archaeological sites in the country. King Kashyapa (477–495 CE) selected Sigiriya as his new capital and built his "
                    "royal palace on top of the rock, decorating the walls with colourful frescoes. He also created a giant lion-shaped "
                    "entrance halfway up the rock, which gave Sigiriya its name.\n\n"
                    "After the king’s death, the site became a Buddhist monastery and remained active until the 14th century. Today, "
                    "Sigiriya is a UNESCO World Heritage Site known for its ancient gardens, rock inscriptions, water features, and "
                    "amazing engineering. It is considered one of the best-preserved examples of early urban planning and a popular "
                    "location for visitors who enjoy history, culture, and breathtaking views.",
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Managebooking(),
                          ),
                        );
                      },
                      child: const Text(
                        "Book Now",
                        style: TextStyle(fontSize: 16, color: Colors.white),
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

  // Icon Button Widget
  Widget _iconButton(BuildContext context, IconData icon) {
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
