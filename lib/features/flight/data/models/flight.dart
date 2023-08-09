import '../../domain/domain.dart';
import 'models.dart';

class FlightModel extends Flight {
  FlightModel(
      {super.ticketType,
      super.isPassportMandatory,
      super.sourceCode,
      super.fareType,
      super.isRefundable,
      super.type,
      super.passengers,
      super.originDestinationOptions,
      super.fareTotal});

  FlightModel.fromJson(Map<String, dynamic> json) {
    ticketType = json['ticketType'];
    isPassportMandatory = json['IsPassportMandatory'];
    sourceCode = json['sourceCode'];
    fareType = json['FareType'];
    isRefundable = json['IsRefundable'];
    type = json['type'];
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(PassengersModel.fromJson(v));
      });
    }
    if (json['originDestinationOptions'] != null) {
      originDestinationOptions = <OriginDestinationOptions>[];
      json['originDestinationOptions'].forEach((v) {
        originDestinationOptions!
            .add(OriginDestinationOptionsModel.fromJson(v));
      });
    }
    fareTotal = json['fareTotal'] != null
        ? FareTotalModel.fromJson(json['fareTotal'])
        : null;
  }
}
