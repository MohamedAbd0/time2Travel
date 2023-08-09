import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/utils.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class PostFlightSearch extends UseCase<List<Flight>, FlightSearchParams> {
  final FlightsRepository _repo;

  PostFlightSearch(this._repo);

  @override
  Future<Either<Failure, List<Flight>>> call(FlightSearchParams params) =>
      _repo.flightSearch(params);
}

class FlightSearchParams {
  final String journeyType;
  final String classType;
  final DateTime departureDate;
  final DateTime? returnDate;
  final String airportOriginCode;
  final String airportDestinationCode;
  final Travelers travelers;
  final int directFlight;

  FlightSearchParams({
    required this.journeyType,
    required this.classType,
    required this.departureDate,
    required this.returnDate,
    required this.airportOriginCode,
    required this.airportDestinationCode,
    required this.travelers,
    required this.directFlight,
  });

  Map<String, dynamic> toMap() {
    return {
      'journeyType': journeyType,
      'class': classType,
      "OriginDestinationInfo": [
        journeyType == "Return"
            ? {
                "departureDate": departureDate.toFormatApiDate(),
                "returnDate": returnDate?.toFormatApiDate(),
                "airportOriginCode": airportOriginCode,
                "airportDestinationCode": airportDestinationCode
              }
            : {
                "departureDate": departureDate.toFormatApiDate(),
                "airportOriginCode": airportOriginCode,
                "airportDestinationCode": airportDestinationCode
              }
      ],
      'adults': travelers.adultCount,
      'childs': travelers.childCount,
      'infants': travelers.babyCount,
      'directFlight': directFlight,
    };
  }
}
