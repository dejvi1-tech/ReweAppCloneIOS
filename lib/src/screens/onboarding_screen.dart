import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../routes.dart';

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    final onboardingPages = [
      const OnboardingPage(
        image: 'assets/images/onboarding_1.png',
        title: 'Frische Lebensmittel',
        subtitle: 'Entdecke tausende frische Produkte in bester Qualität direkt zu dir nach Hause.',
      ),
      const OnboardingPage(
        image: 'assets/images/onboarding_2.png',
        title: 'Schnelle Lieferung',
        subtitle: 'Bestelle heute und erhalte deine Einkäufe schon am nächsten Tag.',
      ),
      const OnboardingPage(
        image: 'assets/images/onboarding_3.png',
        title: 'Exklusive Angebote',
        subtitle: 'Spare mit unseren wöchentlichen Angeboten und sammle Bonuspunkte.',
      ),
    ];

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) => currentPage.value = index,
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) => onboardingPages[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingPages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentPage.value == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentPage.value == index
                              ? CupertinoColors.systemRed
                              : CupertinoColors.systemGrey4,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      if (currentPage.value > 0)
                        CupertinoButton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text('Zurück'),
                        ),
                      const Spacer(),
                      if (currentPage.value < onboardingPages.length - 1)
                        CupertinoButton.filled(
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text('Weiter'),
                        )
                      else
                        CupertinoButton.filled(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                          },
                          child: const Text('Los geht\'s'),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                    },
                    child: const Text(
                      'Überspringen',
                      style: TextStyle(color: CupertinoColors.systemGrey),
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
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CupertinoColors.systemGrey6,
            ),
            child: const Icon(
              CupertinoIcons.photo,
              size: 100,
              color: CupertinoColors.systemGrey3,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}