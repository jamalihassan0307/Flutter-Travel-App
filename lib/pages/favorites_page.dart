import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidesign08/providers/favorites_provider.dart';
import 'package:uidesign08/widgets/hotel_card.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              elevation: 0,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Favorites',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Your dream destinations',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<FavoritesProvider>(
              builder: (context, favoritesProvider, child) {
                final favorites = favoritesProvider.favorites;

                if (favorites.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 80,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No favorites yet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Start adding your favorite places',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: EdgeInsets.all(20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => HotelCard(
                        item: favorites[index],
                        onTap: () => _showBookingBottomSheet(context, favorites[index]),
                      ),
                      childCount: favorites.length,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingBottomSheet(BuildContext context, Item hotel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookingBottomSheet(hotel: hotel),
    );
  }
} 