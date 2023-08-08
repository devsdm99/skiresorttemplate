import 'package:flutter/cupertino.dart';

class ForfaitProvider with ChangeNotifier {
  static const double adultForfaitPrice = 50.00;
  static const double juniorForfaitPrice = 40.00;
  static const double childForfaitPrice = 30.00;

  DateTime? _date;
  int? _adultForfaits;
  int? _juniorForfaits;
  int? _childForfaits;

  DateTime get forfaitDate => _date ?? DateTime.now();
  int get adultForfaits => _adultForfaits ?? 0;
  int get juniorForfaits => _juniorForfaits ?? 0;
  int get childForfaits => _childForfaits ?? 0;
  int get totalForfaits => adultForfaits + juniorForfaits + childForfaits;
  set forfaitDate(DateTime newDate) {
    _date = newDate;
    notifyListeners();
  }

  set adultForfaits(int forfaits) {
    _adultForfaits = forfaits;
    notifyListeners();
  }

  set juniorForfaits(int forfaits) {
    _juniorForfaits = forfaits;
    notifyListeners();
  }

  set childForfaits(int forfaits) {
    _childForfaits = forfaits;
    notifyListeners();
  }

  void resetForfaits() {
    _adultForfaits = 0;
    _juniorForfaits = 0;
    _childForfaits = 0;
    notifyListeners();
  }
}
