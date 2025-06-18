import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/authentication/presentation/views/login_view.dart';
import 'package:electronics_app/features/authentication/presentation/views/signup_view.dart';
import 'package:electronics_app/features/home/presentation/views/home_view.dart';
import 'package:electronics_app/features/profile/presentation/profile_view.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.abc, color: AppColors.transparent),
      label: '',
    ),
  ];

  final List<Widget> _viewslist = const [
    HomeView(),
    ProfileView(),
    LoginView(),
    SignupView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _viewslist[_selectedIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.customColor,
          shape: CircleBorder(),
          child: Icon(Icons.shopping_bag_outlined, color: AppColors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: SizedBox(
        height: 66,
        child: BottomNavigationBar(
          onTap: onItemTapped,
          items: items,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 26,
          selectedFontSize: 12,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey86,
          backgroundColor: AppColors.white,
          unselectedLabelStyle: TextStyle(fontSize: 0),
          selectedLabelStyle: TextStyle(fontSize: 0),
          elevation: 2,
        ),
      ),
    );
  }
}
