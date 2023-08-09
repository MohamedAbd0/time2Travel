part of 'flight_cubit.dart';

class FlightState extends Equatable {
  final List<Flight> flights;
  final String error;
  final RequestState searchState;
  final FlightSearchParams? flightSearchParams;

  const FlightState({
    this.flights = const [],
    this.error = "",
    this.searchState = RequestState.loading,
    this.flightSearchParams,
  });

  FlightState copyWith({
    List<Flight>? flights,
    String? error,
    RequestState? searchState,
    FlightSearchParams? flightSearchParams,
  }) {
    return FlightState(
      flights: flights ?? this.flights,
      error: error ?? this.error,
      searchState: searchState ?? this.searchState,
      flightSearchParams: flightSearchParams ?? this.flightSearchParams,
    );
  }

  @override
  List<Object?> get props => [flights, error, searchState, flightSearchParams];
}

enum RequestState {
  loading,
  loaded,
  error,
}
