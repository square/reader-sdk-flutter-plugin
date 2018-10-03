class Card {

  final String brand;
  final String lastFourDigits;

  Card(
    this.brand,
    this.lastFourDigits,

  );

  static Card castToCard(Map<dynamic, dynamic> cardNativeObject) {
    return Card(
      cardNativeObject['brand'],
      cardNativeObject['lastFourDigits'],
    );
  }
}
