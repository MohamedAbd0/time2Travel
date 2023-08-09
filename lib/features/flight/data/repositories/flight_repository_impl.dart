import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/data/data.dart';
import 'package:time2Travel/features/flight/domain/domain.dart';

class FlightsRepositoryImpl implements FlightsRepository {
  /// Data Source
  final FlightsRemoteDatasource flightsRemoteDatasource;
  const FlightsRepositoryImpl(this.flightsRemoteDatasource);

  @override
  Future<Either<Failure, List<Flight>>> flightSearch(
      FlightSearchParams flightSearchParams) async {
    final response =
        await flightsRemoteDatasource.flightSearch(flightSearchParams);
    return response;
  }
}
