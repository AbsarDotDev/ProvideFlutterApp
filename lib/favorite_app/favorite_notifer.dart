import 'package:flutter/cupertino.dart';

class FavortieItemNotifer extends ChangeNotifier {
  List<int> _favorites = [];
  List<int> get favorites => _favorites;
  void additem(int val) {
    _favorites.add(val);
    notifyListeners();
  }

  void removeitem(int val) {
    _favorites.remove(val);
    notifyListeners();
  }

  void removeitemat(int val) {
    _favorites.removeAt(val);
    notifyListeners();
  }
}
