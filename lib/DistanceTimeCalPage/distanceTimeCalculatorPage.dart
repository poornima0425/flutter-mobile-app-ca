import 'package:flutter/material.dart';

//DISTANCE & TRAVEL TIME CALCULATOR PAGE
class DistanceTimeCalculatorPage extends StatefulWidget {
  const DistanceTimeCalculatorPage({super.key});

  @override
  State<DistanceTimeCalculatorPage> createState() => _DistanceTimeCalculatorPageState();
}

class _DistanceTimeCalculatorPageState extends State<DistanceTimeCalculatorPage> {
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController speedController = TextEditingController();

  double travelTime = 0;

  void calculateTime() {
    double distance = double.tryParse(distanceController.text) ?? 0;
    double speed = double.tryParse(speedController.text) ?? 1; // Avoid divide by zero
    setState(() {
      travelTime = distance / speed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distance & Travel Time"),
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
                  "Distance & Travel Time Calculator",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: distanceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Distance (km)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: speedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Speed (km/h)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateTime,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Approx. Travel Time: ${travelTime.toStringAsFixed(2)} hours",
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
