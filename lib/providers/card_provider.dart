import 'package:skiresorttemplate/models/models.dart';
import 'package:skiresorttemplate/providers/providers.dart';

import '../helpers/helpers.dart';

class CardProvider extends BaseProvider {
  final List<CreditCardModel> _cards = ClassHelper.cards;

  get cards => _cards;

  void addCard(CreditCardModel card) {
    _cards.add(card);
    notifyListeners();
  }

  void removeCard(CreditCardModel card) {
    _cards.remove(card);
    notifyListeners();
  }
}
