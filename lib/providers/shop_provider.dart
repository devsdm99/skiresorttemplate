import 'package:flutter/cupertino.dart';

class ForfaitProvider with ChangeNotifier {
  DateTime? _date;
  int? _forfaits;

  DateTime get forfaitDate => _date ?? DateTime.now();
  int get forfaits => _forfaits ?? 0;

  set forfaitDate(DateTime newDate) {
    _date = newDate;
    notifyListeners();
  }

  set forfaits(int forfaits) {
    _forfaits = forfaits;
    notifyListeners();
  }
}
