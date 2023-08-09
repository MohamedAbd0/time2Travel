import '../../domain/domain.dart';

class PriceTaxesModel extends PriceTaxes {
  PriceTaxesModel(
      {super.taxCode, super.amount, super.currencyCode, super.decimalPlaces});

  PriceTaxesModel.fromJson(Map<String, dynamic> json) {
    taxCode = json['TaxCode'];
    amount = json['Amount'];
    currencyCode = json['CurrencyCode'];
    decimalPlaces = json['DecimalPlaces'];
  }
}
