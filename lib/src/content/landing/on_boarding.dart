import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of onboarding items
  final List<Map<String, String>> _onboardingData = [
    {
      'image':
          'assets/images/onboarding/onboarding1.png', // Replace with actual image paths
      'text': 'Start Your Journey Towards A More Active Lifestyle',
    },
    {
      'image': 'assets/images/onboarding/onboarding2.png',
      'text': 'Track Your Progress And Stay Motivated',
    },
    {
      'image': 'assets/images/onboarding/onboarding3.png',
      'text': 'Achieve Your Fitness Goals With Smart Lifters',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding/onboarding1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        color: Colors.yellow,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.directions_run,
                              size: 36,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _onboardingData[index]['text']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _onboardingData.length,
                        effect: const WormEffect(
                          activeDotColor: Colors.black,
                          dotColor: Colors.white,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == _onboardingData.length - 1) {
                    // Navigate to the next screen (e.g., Home)
                    Navigator.pushReplacementNamed(context, '/onboarding/gender');
                  } else {
                    // Move to the next page
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  _currentPage == _onboardingData.length - 1 ? 'Finish' : 'Next',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
