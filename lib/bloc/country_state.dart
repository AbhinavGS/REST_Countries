part of 'country_bloc.dart';

enum GetCountryDataStatus { initial, success, failure, loading }

class CountryState extends Equatable {
  CountryState({
    this.getCountryDataStatus = GetCountryDataStatus.initial,
    this.getCountryDataList = const [],
  });

  final GetCountryDataStatus getCountryDataStatus;
  List<dynamic> getCountryDataList;

  static CountryState? fromMap(Map<String, dynamic> json) {}

  Map<String, dynamic>? toMap() {}

  CountryState copyWith({
    GetCountryDataStatus? getCountryDataStatus,
    List<dynamic>? getCountryDataList,
  }) {
    return CountryState(
      getCountryDataStatus: getCountryDataStatus ?? this.getCountryDataStatus,
      getCountryDataList: getCountryDataList ?? this.getCountryDataList,
    );
  }

  @override
  List<Object> get props => [
        getCountryDataStatus,
        getCountryDataList,
      ];
}
