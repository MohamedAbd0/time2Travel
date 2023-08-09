import 'entities.dart';

class Passengers {
  List<String>? baggage;
  List<String>? cabinBaggage;
  String? type;
  int? quantity;
  PriceBase? priceBase;
  PriceBase? priceService;
  PriceBase? priceSurcharges;
  List<PriceTaxes>? priceTaxes;
  PriceBase? priceTotal;
  PenaltyDetails? penaltyDetails;

  Passengers(
      {this.baggage,
      this.cabinBaggage,
      this.type,
      this.quantity,
      this.priceBase,
      this.priceService,
      this.priceSurcharges,
      this.priceTaxes,
      this.priceTotal,
      this.penaltyDetails});
}
