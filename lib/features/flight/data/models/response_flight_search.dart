import 'flight.dart';

class ResponseFlightSearchModel {
  String? sessionId;
  List<FlightModel>? flights;

  ResponseFlightSearchModel({this.sessionId, this.flights});

  ResponseFlightSearchModel.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    if (json['flights'] != null) {
      flights = <FlightModel>[];
      json['flights'].forEach((v) {
        flights!.add(FlightModel.fromJson(v));
      });
    }
  }
}
