import 'package:flutter/foundation.dart';
import 'package:uidesign08/data/data.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  bool isFavorite(Item item) => _favorites.contains(item);

  void toggleFavorite(Item item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }
}
