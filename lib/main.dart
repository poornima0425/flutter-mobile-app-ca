import 'dart:async';
import 'package:flutter/material.dart';
import 'SignUpPage/signUpPage.dart';
import 'LoginPage/loginPage.dart';
import 'package:mobile_app_ca/SignUpPage/signuppage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://ngnjvvkelmgdiiwpuvaz.supabase.co',
    anonKey: 'sb_publishable_DXY067y0R5eTuAffpD6Ing__h2zG_3I',
  );


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: OnboardingCarousel(),
    );
  }
}

class OnboardingCarousel extends StatefulWidget {
  const OnboardingCarousel({super.key});

  @override
  State<OnboardingCarousel> createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  final List<String> images = [
    //put image 
    "assets/t2.jpg",
    "assets/t3.jpg",
    "assets/t4.jpg",
  ];

  final List<String> images = [
    //put images
    "assets/t2.jpg",
    "assets/t3.jpg",
    "assets/t4.jpg",
  ];

  @override
   void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        int nextPage = currentPage + 1;
        if (nextPage >= images.length) {
          nextPage = 0; // loop to first
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

   @override
  void dispose() {
    _timer?.cancel(); // stop the timer
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FULL-SCREEN IMAGE SLIDER
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // DARK GRADIENT OVERLAY
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
              ),
            ),
          ),


          // CONTENT ON TOP
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Get ready for",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "New Adventures",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "If you like to travel, then this is for you!\nExplore the beauty of the Sri Lanka.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  // DOT INDICATORS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => dot(index == currentPage),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Let’s Tour",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }

  Widget dot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 14 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(10),

      ),
    );
  }
  Widget dot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 14 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),

    );
  }
}


