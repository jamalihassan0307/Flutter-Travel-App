import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidesign08/providers/navigation_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomNavigationBar(
              currentIndex: navigationProvider.currentIndex,
              onTap: navigationProvider.setIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey.shade400,
              items: [
                _buildNavItem(Icons.home_rounded, 'Home', 0, navigationProvider.currentIndex),
                _buildNavItem(Icons.favorite_rounded, 'Favorites', 1, navigationProvider.currentIndex),
                _buildNavItem(Icons.book_rounded, 'Bookings', 2, navigationProvider.currentIndex),
                _buildNavItem(Icons.person_rounded, 'Profile', 3, navigationProvider.currentIndex),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index, int currentIndex) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon),
      ),
      label: label,
    );
  }
} 