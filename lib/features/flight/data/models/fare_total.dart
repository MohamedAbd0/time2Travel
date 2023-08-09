import '../../domain/domain.dart';
import 'models.dart';

class FareTotalModel extends FareTotal {
  FareTotalModel(
      {super.baseFare, super.serviceTax, super.totalTax, super.total});

  FareTotalModel.fromJson(Map<String, dynamic> json) {
    baseFare = json['baseFare'] != null
        ? PriceBaseModel.fromJson(json['baseFare'])
        : null;
    serviceTax = json['serviceTax'] != null
        ? PriceBaseModel.fromJson(json['serviceTax'])
        : null;
    totalTax = json['totalTax'] != null
        ? PriceBaseModel.fromJson(json['totalTax'])
        : null;
    total =
        json['total'] != null ? PriceBaseModel.fromJson(json['total']) : null;
  }
}
