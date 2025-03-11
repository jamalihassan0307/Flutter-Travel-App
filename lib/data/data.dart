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
    title: 'Discover Luxury Stays',
    subTitle: 'Experience world-class hospitality and unforgettable moments in the most exclusive resorts.',
    image: 'assets/Ozen Reserve Bolifushi - Luxury.jpg',
  ),
  PagesData(
    id: 1,
    title: 'Paradise Awaits',
    subTitle: 'From overwater villas to beachfront resorts, find your perfect luxury escape.',
    image: 'assets/overwater-villas.jpg',
  ),
  PagesData(
    id: 2,
    title: 'Culinary Excellence',
    subTitle: 'Indulge in exceptional dining experiences with world-renowned chefs and stunning views.',
    image: 'assets/beach-grill-restaurant.jpg',
  ),
  PagesData(
    id: 3,
    title: 'Infinity and Beyond',
    subTitle: 'Dive into infinity pools that blend seamlessly with the horizon.',
    image: 'assets/sky-pool.jpg',
  ),
  PagesData(
    id: 4,
    title: 'Royal Treatment',
    subTitle: 'Experience the epitome of luxury in our carefully curated collection of premium resorts.',
    image: 'assets/rambagh-palace-exterior.jpg',
  ),
];

class Menu {
  final int id;
  final String name;

  Menu({required this.id, required this.name});
}

List<Menu> menu = [
  Menu(id: 0, name: 'Featured'),
  Menu(id: 1, name: 'Beachfront'),
  Menu(id: 2, name: 'Luxury'),
  Menu(id: 3, name: 'Family'),
  Menu(id: 4, name: 'Spa & Wellness'),
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
    image: 'assets/Ozen Reserve Bolifushi - Luxury.jpg',
    titel: 'Ozen Reserve Bolifushi',
    location: 'Maldives',
    description: 'Experience ultimate luxury in this exclusive island resort featuring overwater villas, private pools, and world-class dining experiences.',
    price: '\$2,800',
    rating: '4.9',
    days: '5 days',
    itinerary: 'Day 1: Arrival & Spa\nDay 2: Water Sports\nDay 3: Island Tour\nDay 4: Diving\nDay 5: Sunset Cruise',
    weather: '30°C',
    category: ['LUXURY', 'OVERWATER', 'SPA'],
  ),
  Item(
    id: 2,
    image: 'assets/ikos-dassia.jpg',
    titel: 'Ikos Dassia',
    location: 'Corfu, Greece',
    description: 'A stunning beachfront resort offering infinite lifestyle experiences and Mediterranean elegance.',
    price: '\$1,200',
    rating: '4.8',
    days: '7 days',
    itinerary: 'All-inclusive luxury experience with multiple restaurants and activities',
    weather: '25°C',
    category: ['BEACH', 'FAMILY', 'ALL-INCLUSIVE'],
  ),
  Item(
    id: 3,
    image: 'assets/secrets-maroma-beach.jpg',
    titel: 'Secrets Maroma Beach',
    location: 'Riviera Maya, Mexico',
    description: 'Adults-only paradise with pristine beaches and unlimited luxury.',
    price: '\$1,500',
    rating: '4.7',
    days: '4 days',
    itinerary: 'Adults-only luxury experience with gourmet dining and spa services',
    weather: '28°C',
    category: ['ADULTS', 'BEACH', 'GOURMET'],
  ),
  Item(
    id: 4,
    image: 'assets/rambagh-palace-exterior.jpg',
    titel: 'Rambagh Palace',
    location: 'Jaipur, India',
    description: 'Live like royalty in this converted palace with stunning architecture and royal service.',
    price: '\$2,200',
    rating: '4.9',
    days: '3 days',
    itinerary: 'Royal palace experience with traditional hospitality',
    weather: '32°C',
    category: ['HERITAGE', 'LUXURY', 'CULTURE'],
  ),
  Item(
    id: 5,
    image: 'assets/rixos-premium-belek.jpg',
    titel: 'Rixos Premium Belek',
    location: 'Antalya, Turkey',
    description: 'Luxury beach resort with extensive sports and entertainment facilities.',
    price: '\$1,800',
    rating: '4.8',
    days: '6 days',
    itinerary: 'Premium all-inclusive with sports and entertainment',
    weather: '26°C',
    category: ['BEACH', 'SPORTS', 'FAMILY'],
  ),
  Item(
    id: 6,
    image: 'assets/hotel-colline-de-france.jpg',
    titel: 'Hotel Colline de France',
    location: 'Gramado, Brazil',
    description: 'A French-inspired luxury boutique hotel offering an intimate and romantic atmosphere with exceptional service.',
    price: '\$850',
    rating: '4.9',
    days: '3 days',
    itinerary: 'Romantic getaway with French cuisine and wine tasting experience',
    weather: '22°C',
    category: ['BOUTIQUE', 'ROMANTIC', 'CULINARY'],
  ),
  Item(
    id: 7,
    image: 'assets/voyage-belek-golf-spa.jpg',
    titel: 'Voyage Belek Golf & Spa',
    location: 'Belek, Turkey',
    description: 'Ultra-luxury golf resort with extensive spa facilities and private beach access.',
    price: '\$1,600',
    rating: '4.8',
    days: '5 days',
    itinerary: 'Golf packages with spa treatments and beach activities',
    weather: '28°C',
    category: ['GOLF', 'SPA', 'BEACH'],
  ),
  Item(
    id: 8,
    image: 'assets/salinas-maragogi-all.jpg',
    titel: 'Salinas Maragogi',
    location: 'Maragogi, Brazil',
    description: 'All-inclusive beach resort with natural pools and water sports activities.',
    price: '\$1,400',
    rating: '4.7',
    days: '6 days',
    itinerary: 'Beach activities and water sports included',
    weather: '30°C',
    category: ['BEACH', 'ALL-INCLUSIVE', 'WATER_SPORTS'],
  ),
];

class Categories {
  final int id;
  final String image;
  final String name;

  Categories({required this.id, required this.image, required this.name});
}

List<Categories> categories = [
  Categories(id: 0, image: 'assets/overwater-villas.jpg', name: 'Overwater'),
  Categories(id: 1, image: 'assets/sky-pool.jpg', name: 'Infinity Pools'),
  Categories(id: 2, image: 'assets/beach-grill-restaurant.jpg', name: 'Dining'),
  Categories(id: 3, image: 'assets/aerial-view.jpg', name: 'Beachfront'),
  Categories(id: 4, image: 'assets/wvpbedroom.jpg', name: 'Suites'),
  Categories(id: 5, image: 'assets/kain-pool-kids-section.jpg', name: 'Family'),
  Categories(id: 6, image: 'assets/rbvpool.jpg', name: 'Pools'),
  Categories(id: 7, image: 'assets/discover-pure-paradise.jpg', name: 'Luxury'),
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
