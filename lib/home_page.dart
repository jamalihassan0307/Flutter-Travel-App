import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uidesign08/core/color.dart';
import 'package:uidesign08/data/data.dart';
import 'package:uidesign08/details_page.dart';
import 'package:provider/provider.dart';
import 'package:uidesign08/pages/favorites_page.dart';
import 'package:uidesign08/pages/bookings_page.dart';
import 'package:uidesign08/pages/profile_page.dart';
import 'package:uidesign08/providers/navigation_provider.dart';
import 'package:uidesign08/widgets/hotel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    HomeContent(),
    FavoritesPage(),
    BookingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: _pages[navigationProvider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) => navigationProvider.setIndex(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String _searchQuery = '';
  int _selectedCategoryIndex = 0;
  List<Item> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(items);
  }

  void _filterItems() {
    setState(() {
      _filteredItems = items.where((item) {
        final matchesSearch = item.titel.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.location.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.category.any((category) => category.toLowerCase().contains(_searchQuery.toLowerCase()));

        final matchesCategory =
            _selectedCategoryIndex == 0 || item.category.contains(menu[_selectedCategoryIndex].name.toUpperCase());

        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'LuxStays',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: blueColor,
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _filterItems();
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search luxury stays...',
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: menu.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategoryIndex = index;
                              _filterItems();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: _selectedCategoryIndex == index ? Theme.of(context).primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                menu[index].name,
                                style: TextStyle(
                                  color: _selectedCategoryIndex == index ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => HotelCard(item: _filteredItems[index]),
                childCount: _filteredItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
