import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/screens/main/bottom_nav_bar.dart';
import '/widgets/screens/main/home/add_transactions_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController scrollController = ScrollController();
  bool isPlusTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  Text(
                    'Username',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(145, 145, 159, 1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Iriana Saliha',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(22, 23, 25, 1),
                    ),
                  ),
                  const SizedBox(height: 48),
                  ...[
                    {
                      'icon': 'assets/icons/wallet.svg',
                      'text': 'Account',
                      'border_radius': const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      'screen': '/accounts-list',
                    },
                    {
                      'icon': 'assets/icons/settings.svg',
                      'text': 'Settings',
                      'border_radius': const BorderRadius.vertical(
                        bottom: Radius.circular(24),
                      ),
                      'screen': '/settings',
                    }
                  ].map(
                    (el) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          el['screen'] as String,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: el['border_radius'] as BorderRadius,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(238, 229, 255, 1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  el['icon'] as String,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                el['text'] as String,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(41, 43, 45, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          isPlusTapped
              ? AddTransactionsSection(
                  close: () {
                    setState(() {
                      isPlusTapped = false;
                    });
                  },
                )
              : const SizedBox(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                isPlusTapped = !isPlusTapped;
              });
            },
            backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
            shape: const CircleBorder(),
            elevation: 0,
            child: Transform.rotate(
              angle: isPlusTapped ? 90 : 0,
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
