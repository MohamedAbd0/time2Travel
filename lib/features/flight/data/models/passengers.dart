import '../../domain/domain.dart';
import 'models.dart';

class PassengersModel extends Passengers {
  PassengersModel(
      {super.baggage,
      super.cabinBaggage,
      super.type,
      super.quantity,
      super.priceBase,
      super.priceService,
      super.priceSurcharges,
      super.priceTaxes,
      super.priceTotal,
      super.penaltyDetails});

  PassengersModel.fromJson(Map<String, dynamic> json) {
    baggage = json['Baggage'].cast<String>();
    cabinBaggage = json['CabinBaggage'].cast<String>();
    type = json['Type'];
    quantity = json['Quantity'];
    priceBase = json['price_Base'] != null
        ? PriceBaseModel.fromJson(json['price_Base'])
        : null;
    priceService = json['price_Service'] != null
        ? PriceBaseModel.fromJson(json['price_Service'])
        : null;
    priceSurcharges = json['price_Surcharges'] != null
        ? PriceBaseModel.fromJson(json['price_Surcharges'])
        : null;
    if (json['price_Taxes'] != null) {
      priceTaxes = <PriceTaxes>[];
      json['price_Taxes'].forEach((v) {
        priceTaxes!.add(PriceTaxesModel.fromJson(v));
      });
    }
    priceTotal = json['price_Total'] != null
        ? PriceBaseModel.fromJson(json['price_Total'])
        : null;
    penaltyDetails = json['PenaltyDetails'] != null
        ? PenaltyDetailsModel.fromJson(json['PenaltyDetails'])
        : null;
  }
}
