import 'package:flutter/material.dart';
import 'package:paged/features/onboarding/presentation/pages/introduction.dart';
import 'package:paged/features/onboarding/presentation/pages/login_music_provider.dart';
import 'package:paged/features/onboarding/presentation/pages/group_link_invitation.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      IntroductionPage(
        pageIndex: 0,
        currentPage: _currentPage,
        onNext: () {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      LoginMusicProvider(
        pageIndex: 1,
        currentPage: _currentPage,
        onNext: () {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      GroupLinkInvitation(
        pageIndex: 2,
        currentPage: _currentPage,
        onBack: () {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        )
      ),
    );
  }
}