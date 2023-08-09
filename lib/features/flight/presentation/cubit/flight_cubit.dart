import 'package:equatable/equatable.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  FlightCubit(this._postFlightSearch) : super(const FlightState());

  final PostFlightSearch _postFlightSearch;

  @override
  Future<void> close() {
    // Additional cleanup if needed
    return super.close();
  }

  Future<void> flightSearch(FlightSearchParams params) async {
    emit(FlightState(
        searchState: RequestState.loading, flightSearchParams: params));
    final data = await _postFlightSearch.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FlightState(
              error: l.message.toString(), searchState: RequestState.error));
        }
      },
      (r) => emit(FlightState(
          flights: r,
          searchState: RequestState.loaded,
          flightSearchParams: params)),
    );
  }
}
