import 'entities.dart';

class FareTotal {
  PriceBase? baseFare;
  PriceBase? serviceTax;
  PriceBase? totalTax;
  PriceBase? total;

  FareTotal({this.baseFare, this.serviceTax, this.totalTax, this.total});
}
