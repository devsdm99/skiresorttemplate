class PromotionCodeHelper {
  final codes = Map<String, double>.from({
    "PROMO10": 10,
    "PROMO20": 20,
    "PROMO30": 30,
    "PROMO40": 40,
    "PROMO50": 50,
  });

  bool isValid(String code) {
    return codes.keys.contains(code);
  }
}
