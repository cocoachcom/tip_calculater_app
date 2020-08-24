import 'package:tip_calculater_app/data/TipValues.dart';

class Settings {
  int tax_rate;
  bool atm_text_entry;
  bool display_tax;
  bool exclude_tax;
  String rounding;
  int index;
  bool show_keybody;
  TipValues tip_values;

  Settings({this.tax_rate, this.atm_text_entry, this.display_tax, this.exclude_tax, this.rounding, this.index, this.show_keybody, this.tip_values});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      tax_rate: json['tax_rate'],
      atm_text_entry: json['atm_text_entry'],
      display_tax: json['display_tax'],
      exclude_tax: json['exclude_tax'],
      rounding: json['rounding'],
      index: json['index'],
      show_keybody: json['show_keybody'],
      tip_values: json['tip_values'] != null ? TipValues.fromJson(json['tip_values']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_rate'] = this.tax_rate;
    data['atm_text_entry'] = this.atm_text_entry;
    data['display_tax'] = this.display_tax;
    data['exclude_tax'] = this.exclude_tax;
    data['rounding'] = this.rounding;
    data['index'] = this.index;
    data['show_keybody'] = this.show_keybody;
    if (this.tip_values != null) {
      data['tip_values'] = this.tip_values.toJson();
    }
    return data;
  }
}