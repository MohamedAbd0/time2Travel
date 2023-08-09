class TourSegments {
  int? seatsRemaining;
  String? flightNumber;
  String? airlineCode;
  String? airlineName;
  String? departureAirportCode;
  String? departureDateTime;
  String? arrivalAirportCode;
  String? arrivalDateTime;
  String? cabinClassCode;
  String? journeyDuration;
  String? cabinClassText;

  TourSegments(
      {this.seatsRemaining,
      this.flightNumber,
      this.airlineCode,
      this.airlineName,
      this.departureAirportCode,
      this.departureDateTime,
      this.arrivalAirportCode,
      this.arrivalDateTime,
      this.cabinClassCode,
      this.journeyDuration,
      this.cabinClassText});
}
