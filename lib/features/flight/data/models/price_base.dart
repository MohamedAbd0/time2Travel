import '../../domain/domain.dart';

class PriceBaseModel extends PriceBase {
  PriceBaseModel({super.amount, super.currencyCode, super.decimalPlaces});

  PriceBaseModel.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    currencyCode = json['CurrencyCode'];
    decimalPlaces = json['DecimalPlaces'];
  }
}
