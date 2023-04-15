import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryState()) {
    on<GetCountryData>(
        ((GetCountryData event, Emitter<CountryState> emit) async {
      try {
        emit(
            state.copyWith(getCountryDataStatus: GetCountryDataStatus.loading));
        final response = await Dio().get("https://restcountries.com/v3.1/all");
        final countryData = response.data;
        emit(
            state.copyWith(getCountryDataStatus: GetCountryDataStatus.success));
        emit(state.copyWith(getCountryDataList: countryData));
        print(countryData);
      } catch (e) {
        emit(state.copyWith(
          getCountryDataStatus: GetCountryDataStatus.failure,
        ));
      }
    }));
  }
}
