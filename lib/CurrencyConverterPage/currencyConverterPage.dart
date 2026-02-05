import 'package:flutter/material.dart';

//CURRENCY CONVERTER PAGE
class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController amountController = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'LKR';
  double result = 0;

  // Example conversion rates
  final Map<String, double> rates = {
    'USD': 360, // USD to LKR
    'EUR': 390, // EUR to LKR
  };

  void convertCurrency() {
    double amount = double.tryParse(amountController.text) ?? 0;
    setState(() {
      if (rates.containsKey(fromCurrency)) {
        result = amount * rates[fromCurrency]!;
      } else {
        result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
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
                  "Currency Converter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text("From:"),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: fromCurrency,
                      items: const [
                        DropdownMenuItem(value: 'USD', child: Text('USD')),
                        DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          fromCurrency = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: convertCurrency,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Convert"),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Converted Amount: ${result.toStringAsFixed(2)} $toCurrency",
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
