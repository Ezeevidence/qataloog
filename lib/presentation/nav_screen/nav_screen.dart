import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qataloog/presentation/accounts/screens/account_screen.dart';
import 'package:qataloog/presentation/earnings/screens/earnings_screen.dart';
import 'package:qataloog/presentation/home/screens/home_screen.dart';
import 'package:qataloog/presentation/library/screens/library_screen.dart';
import 'package:qataloog/presentation/nav_screen/controller.dart';
import 'package:qataloog/presentation/uploads/screens/upload_screen/upload_screen.dart';

class NavigationScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const HomeScreen(),
    const LibraryScreen(),
    const UploadScreen(),
    const EarningsScreen(),
    const AccountScreen()
  ];

  NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationController>(
        builder: (context, provider, _) {
          return _screens.elementAt(provider.currentPageIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_open), label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.upload), label: "Uploads"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.moneyBillTransfer),
              label: "Earnings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Account"),
        ],
        currentIndex:
            Provider.of<NavigationController>(context).currentPageIndex,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          Provider.of<NavigationController>(context, listen: false)
              .setCurrentPageIndex(index);
        },
      ),
    );
  }
}
