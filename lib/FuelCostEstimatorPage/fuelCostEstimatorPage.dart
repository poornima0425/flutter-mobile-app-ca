import 'package:flutter/material.dart';

// ----------------- FUEL COST ESTIMATOR PAGE -----------------
class FuelCostEstimatorPage extends StatefulWidget {
  const FuelCostEstimatorPage({super.key});

  @override
  State<FuelCostEstimatorPage> createState() => _FuelCostEstimatorPageState();
}

class _FuelCostEstimatorPageState extends State<FuelCostEstimatorPage> {
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController efficiencyController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  double fuelCost = 0;

  void calculateFuelCost() {
    double distance = double.tryParse(distanceController.text) ?? 0;
    double efficiency = double.tryParse(efficiencyController.text) ?? 1; // avoid divide by zero
    double price = double.tryParse(priceController.text) ?? 0;

    setState(() {
      fuelCost = (distance / efficiency) * price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fuel Cost Estimator"),
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
                  "Fuel Cost Estimator",
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
                  controller: efficiencyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Fuel Efficiency (km/l)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Fuel Price (LKR/l)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateFuelCost,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Approx. Fuel Cost: ${fuelCost.toStringAsFixed(2)} LKR",
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
