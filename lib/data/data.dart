class PagesData {
  final int id;
  final String title;
  final String subTitle;
  final String image;

  PagesData({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<PagesData> pages = [
  PagesData(
    id: 0,
    title:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    subTitle:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    image: 'assets/07.jpg',
  ),
  PagesData(
    id: 1,
    title:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    subTitle:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    image: 'assets/02.jpg',
  ),
  PagesData(
    id: 2,
    title:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    subTitle:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    image: 'assets/03.jpg',
  ),
  PagesData(
    id: 3,
    title:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    subTitle:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    image: 'assets/04.jpg',
  ),
  PagesData(
    id: 4,
    title:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    subTitle:
        'Flutter gives us a lot of standard views to use in our projects, but from time to time we need to create custom views. ',
    image: 'assets/05.jpg',
  ),
];

class Menu {
  final int id;
  final String name;

  Menu({required this.id, required this.name});
}

List<Menu> menu = [
  Menu(id: 0, name: 'Most Popular'),
  Menu(id: 1, name: 'Recommended'),
  Menu(id: 2, name: 'Treanding'),
  Menu(id: 3, name: 'Natural'),
  Menu(id: 4, name: 'Countryside'),
];

class Item {
  final int id;
  final String image;
  final String titel;
  final String location;
  final String description;
  final String price;
  final String rating;
  final String days;
  final String itinerary;
  final String weather;
  final List<String> category;

  Item({
    required this.id,
    required this.image,
    required this.titel,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    required this.days,
    required this.itinerary,
    required this.weather,
    required this.category,
  });
}

List<Item> items = [
  Item(
    id: 1,
    image: 'assets/beach-grill-restaurant.jpg',
    titel: 'Beach Grill Restaurant',
    location: 'Maldives',
    description: 'Experience fine dining at its best with our beachfront grill restaurant offering fresh seafood and premium cuts with stunning ocean views.',
    price: '\$450',
    rating: '4.9',
    days: 'Open Daily',
    itinerary: 'Breakfast: 7:00 AM - 10:30 AM\nLunch: 12:00 PM - 3:00 PM\nDinner: 6:30 PM - 10:30 PM\nSpecialties include fresh caught seafood, premium steaks, and signature cocktails.',
    weather: '28°C',
    category: ['DINING', 'BEACHFRONT', 'LUXURY'],
  ),
  Item(
    id: 2,
    image: 'assets/Ozen Reserve Bolifushi - Luxury.jpg',
    titel: 'Ozen Reserve Bolifushi',
    location: 'Bolifushi Island, Maldives',
    description: 'An ultra-luxury all-inclusive resort featuring overwater villas, private pools, and world-class dining experiences.',
    price: '\$2800',
    rating: '4.9',
    days: '5 days',
    itinerary: 'Luxury overwater accommodation with private pools\nPersonal butler service\nUnlimited dining at specialty restaurants\nWater sports and diving activities\nSpa treatments',
    weather: '30°C',
    category: ['RESORT', 'LUXURY', 'OVERWATER'],
  ),
  // Add more items following similar pattern...
];

class Categories {
  final int id;
  final String image;
  final String name;

  Categories({required this.id, required this.image, required this.name});
}

List<Categories> categories = [
  Categories(id: 0, image: 'assets/overwater-villas.jpg', name: 'Overwater Villas'),
  Categories(id: 1, image: 'assets/sky-pool.jpg', name: 'Infinity Pools'),
  Categories(id: 2, image: 'assets/beach-grill-restaurant.jpg', name: 'Fine Dining'),
  Categories(id: 3, image: 'assets/aerial-view.jpg', name: 'Beachfront'),
  Categories(id: 4, image: 'assets/spa-wellness.jpg', name: 'Spa & Wellness'),
  Categories(id: 5, image: 'assets/kain-pool-kids-section.jpg', name: 'Family'),
];

class BottonNavData {
  final int id;

  final String image;

  BottonNavData({required this.id, required this.image});
}

List<BottonNavData> navData = [
  BottonNavData(id: 0, image: 'assets/icons/home.svg'),
  BottonNavData(id: 1, image: 'assets/icons/calendar.svg'),
  BottonNavData(id: 2, image: 'assets/icons/comment.svg'),
  BottonNavData(id: 3, image: 'assets/icons/user.svg'),
];
