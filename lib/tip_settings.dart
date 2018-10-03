
class TipSettings {
  bool showCustomTipField = false;
  bool showSeparateTipScreen = true;
  List<int> tipPercentages = [15, 20, 25];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> tipSettingsMap = Map<String, dynamic>();
    tipSettingsMap['showCustomTipField'] = this.showCustomTipField;
    tipSettingsMap['showSeparateTipScreen'] = this.showSeparateTipScreen;
    if (this.tipPercentages != null) {
      tipSettingsMap['tipPercentages'] = this.tipPercentages;
    }
    return tipSettingsMap;
  }
}
