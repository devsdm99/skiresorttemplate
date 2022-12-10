import 'package:flutter/cupertino.dart';

class ForfaitProvider with ChangeNotifier {
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
}
