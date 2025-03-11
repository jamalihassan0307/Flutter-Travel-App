import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidesign08/providers/favorites_provider.dart';
import 'package:uidesign08/widgets/hotel_card.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favorites = favoritesProvider.favorites;
        
        if (favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No favorites yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) => HotelCard(item: favorites[index]),
        );
      },
    );
  }
} 