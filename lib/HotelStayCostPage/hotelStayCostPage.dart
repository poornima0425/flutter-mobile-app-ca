import 'package:flutter/material.dart';

// ----------------- HOTEL STAY COST PAGE -----------------
class HotelStayCostPage extends StatefulWidget {
  const HotelStayCostPage({super.key});

  @override
  State<HotelStayCostPage> createState() => _HotelStayCostPageState();
}

class _HotelStayCostPageState extends State<HotelStayCostPage> {
  final TextEditingController nightsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  double totalCost = 0;

  void calculateHotelCost() {
    double nights = double.tryParse(nightsController.text) ?? 0;
    double price = double.tryParse(priceController.text) ?? 0;

    setState(() {
      totalCost = nights * price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Stay Cost"),
        backgroundColor:  Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hotel Stay Cost Calculator",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nightsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Number of Nights",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Price per Night (LKR)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateHotelCost,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Total Hotel Cost: ${totalCost.toStringAsFixed(2)} LKR",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}