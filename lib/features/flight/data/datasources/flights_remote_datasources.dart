import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/domain/usecases/usecases.dart';
import '../models/models.dart';

abstract class FlightsRemoteDatasource {
  Future<Either<Failure, List<FlightModel>>> flightSearch(
    FlightSearchParams flightSearchParams,
  );
}

class FlightsRemoteDatasourceImpl implements FlightsRemoteDatasource {
  final DioClient _client;

  FlightsRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, List<FlightModel>>> flightSearch(
    FlightSearchParams flightSearchParams,
  ) async {
    final response = await _client.postRequest(
      ListAPI.flightSearch,
      data: flightSearchParams.toMap(),
      converter: (response) =>
          ResponseFlightSearchModel.fromJson(
                  response["data"] as Map<String, dynamic>)
              .flights ??
          [],
    );

    return response;
  }
}
