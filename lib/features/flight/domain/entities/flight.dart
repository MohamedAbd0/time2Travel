import 'entities.dart';

class Flight {
  String? ticketType;
  String? isPassportMandatory;
  String? sourceCode;
  String? fareType;
  String? isRefundable;
  String? type;
  List<Passengers>? passengers;
  List<OriginDestinationOptions>? originDestinationOptions;
  FareTotal? fareTotal;

  Flight(
      {this.ticketType,
      this.isPassportMandatory,
      this.sourceCode,
      this.fareType,
      this.isRefundable,
      this.type,
      this.passengers,
      this.originDestinationOptions,
      this.fareTotal});
}
