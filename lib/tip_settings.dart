
class TipSettings {
  bool showCustomTipField = false;
  bool showSeparateTipScreen = true;
  List<int> tipPercentages = [15, 20, 25];

  Map<String, dynamic> toMap() {
    return {
      'showCustomTipField': showCustomTipField,
      'showSeparateTipScreen': this.showSeparateTipScreen,
      'tipPercentages': tipPercentages,
    };
  }
}
