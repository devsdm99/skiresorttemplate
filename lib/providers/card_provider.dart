import 'package:skiresorttemplate/models/models.dart';
import 'package:skiresorttemplate/providers/providers.dart';

import '../helpers/helpers.dart';

class CardProvider extends BaseProvider {
  final List<CreditCardModel> _cards = CardHelper.cards;
  CreditCardModel? _selectedCard;

  List<CreditCardModel> get cards => _cards;
  CreditCardModel? get selectedCard => _selectedCard;

  set selectedCard(CreditCardModel? value) {
    _cards.firstWhere((card) => card.isSelected).isSelected = false;
    value?.isSelected = true;
    _selectedCard = value;
    notifyListeners();
  }

  void addCard(CreditCardModel card) {
    _cards.add(card);
    notifyListeners();
  }

  void removeCard(CreditCardModel card) {
    _cards.remove(card);
    notifyListeners();
  }
}
