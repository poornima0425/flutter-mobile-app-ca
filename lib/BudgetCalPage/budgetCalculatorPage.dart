import 'package:flutter/material.dart';

//BUDGET CALCULATOR PAGE
class BudgetCalculatorPage extends StatefulWidget {
  const BudgetCalculatorPage({super.key});

  @override
  State<BudgetCalculatorPage> createState() => _BudgetCalculatorPageState();
}

class _BudgetCalculatorPageState extends State<BudgetCalculatorPage> {
  final TextEditingController totalMoneyController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();

  double dailyBudget = 0;
  double remainingMoney = 0;

  void calculateBudget() {
    double totalMoney = double.tryParse(totalMoneyController.text) ?? 0;
    double days = double.tryParse(daysController.text) ?? 1;
    double expenses = double.tryParse(expensesController.text) ?? 0;

    setState(() {
      dailyBudget = (totalMoney - expenses) / days;
      remainingMoney = totalMoney - expenses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Calculator"),
        backgroundColor: Colors.blue,
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
                  "Budget Calculator",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: totalMoneyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Total Money (LKR)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: daysController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Number of Days",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: expensesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Expected Expenses",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateBudget,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Daily Budget: ${dailyBudget.toStringAsFixed(2)} LKR",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "Remaining Money: ${remainingMoney.toStringAsFixed(2)} LKR",
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
