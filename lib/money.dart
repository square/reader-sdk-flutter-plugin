class Money {

  final int amount;
  final String currencyCode;

  Money(
    this.amount,
    [this.currencyCode,]
  );

  static Money castToMoney(Map<dynamic, dynamic> moneyNativeObject) {
    return Money(
      moneyNativeObject['amount'],
      moneyNativeObject['currencyCode'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> moneyMap = Map();
    moneyMap['amount'] = this.amount;
    if(this.currencyCode != null) {
      moneyMap['currencyCode'] = this.currencyCode;
    }
    return moneyMap;
  }
}
