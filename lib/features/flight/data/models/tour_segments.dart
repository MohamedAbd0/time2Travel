import '../../domain/domain.dart';

class TourSegmentsModel extends TourSegments {
  TourSegmentsModel(
      {super.seatsRemaining,
      super.flightNumber,
      super.airlineCode,
      super.airlineName,
      super.departureAirportCode,
      super.departureDateTime,
      super.arrivalAirportCode,
      super.arrivalDateTime,
      super.cabinClassCode,
      super.journeyDuration,
      super.cabinClassText});

  TourSegmentsModel.fromJson(Map<String, dynamic> json) {
    seatsRemaining = json['SeatsRemaining'];
    flightNumber = json['FlightNumber'];
    airlineCode = json['AirlineCode'];
    airlineName = json['AirlineName'];
    departureAirportCode = json['DepartureAirportCode'];
    departureDateTime = json['DepartureDateTime'];
    arrivalAirportCode = json['ArrivalAirportCode'];
    arrivalDateTime = json['ArrivalDateTime'];
    cabinClassCode = json['CabinClassCode'];
    journeyDuration = json['JourneyDuration'];
    cabinClassText = json['CabinClassText'];
  }
}
