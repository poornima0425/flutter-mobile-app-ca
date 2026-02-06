import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sri Lankan Food"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Popular Dishes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FoodCard(
                      image: const AssetImage("assets/img52.jpg"),
                      name: "Kottu Roti",
                      description: "Chopped roti mixed with vegetables, eggs, and meat.",
                    ),
                    FoodCard(
                      image: const AssetImage("assets/img53.jpg"),
                      name: "Crab Curry",
                      description: "Spicy crab curry cooked with traditional spices.",
                    ),
                    FoodCard(
                      image: const AssetImage("assets/img54.jpg"),
                      name: "Lamprais",
                      description: "Dutch-influenced rice dish with meat and sambol.",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Food Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  FoodCategoryCard(
                    title: "Street Food",
                    icon: Icons.fastfood,
                    foods: [
                      {"name": "Kottu Roti", "description": "Chopped roti with veggies, eggs & meat."},
                      {"name": "Hoppers", "description": "Bowl-shaped pancakes served with curry."},
                    ],
                  ),
                  FoodCategoryCard(
                    title: "Traditional",
                    icon: Icons.rice_bowl,
                    foods: [
                      {"name": "Lamprais", "description": "Rice, meat, sambol baked in banana leaf."},
                      {"name": "Pol Sambol", "description": "Coconut sambol with chili and lime."},
                    ],
                  ),
                  FoodCategoryCard(
                    title: "Seafood",
                    icon: Icons.set_meal,
                    foods: [
                      {"name": "Crab Curry", "description": "Spicy Sri Lankan crab curry."},
                      {"name": "Prawn Curry", "description": "Prawns cooked in coconut milk & spices."},
                    ],
                  ),
                  FoodCategoryCard(
                    title: "Desserts",
                    icon: Icons.icecream,
                    foods: [
                      {"name": "Wattalapam", "description": "Coconut custard pudding with jaggery."},
                      {"name": "Kavum", "description": "Deep-fried sweet rice flour cakes."},
                    ],
                  ),
                  FoodCategoryCard(
                    title: "Vegetarian",
                    icon: Icons.eco,
                    foods: [
                      {"name": "Parippu Curry", "description": "Lentil curry cooked with spices."},
                    ],
                  ),
                  FoodCategoryCard(
                    title: "Beverages",
                    icon: Icons.local_cafe,
                    foods: [
                      {"name": "Ceylon Tea", "description": "Famous Sri Lankan black tea."},
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------
// FOOD CARD (Horizontal Scroll)
// -----------------------------------------------------------
class FoodCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String description;

  const FoodCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FoodDetailPage(foods: [
              {"name": name, "description": description},
            ]),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------
// FOOD CATEGORY CARD (Grid)
// -----------------------------------------------------------
class FoodCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Map<String, String>> foods;

  const FoodCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FoodDetailPage(foods: foods),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------
// FOOD DETAIL PAGE
// -----------------------------------------------------------
class FoodDetailPage extends StatelessWidget {
  final List<Map<String, String>> foods;
  const FoodDetailPage({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Details"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.food_bank, color: Colors.blue),
              title: Text(food["name"]!),
              subtitle: Text(food["description"]!),
            ),
          );
        },
      ),
    );
  }
}