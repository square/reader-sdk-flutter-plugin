import 'card.dart';

class CardDetails {

  final String entryMethod;
  final Card card;

  CardDetails(
    this.entryMethod,
    this.card,
  );

  static CardDetails castToCardDetails(Map<dynamic, dynamic> cardDetailsNativeObject) {
    return CardDetails(
      cardDetailsNativeObject['entryMethod'],
      Card.castToCard(cardDetailsNativeObject['card']),
    );
  }
}
