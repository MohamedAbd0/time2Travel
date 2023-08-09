import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/domain/domain.dart';

abstract class FlightsRepository {
  Future<Either<Failure, List<Flight>>> flightSearch(
      FlightSearchParams flightSearchParams);
}
