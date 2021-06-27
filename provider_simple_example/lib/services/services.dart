import 'package:flutter/foundation.dart';


class DataServices with ChangeNotifier {
  String _name = "Tech Enrage";

  String get newName => _name;

  void changeName(String name) async {
    _name = name;

    notifyListeners();
  }
}
