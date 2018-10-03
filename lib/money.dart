class Money {

  final int amount;
  final String currencyCode;

  Money(
    this.amount,
    this.currencyCode
  );

  static Money castToMoney(Map<dynamic, dynamic> moneyNativeObject) {
    return Money(
      moneyNativeObject['amount'],
      moneyNativeObject['currencyCode'],
    );
  }
}
