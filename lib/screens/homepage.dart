import 'package:dio_bloc_final/bloc/country_bloc.dart';
import 'package:dio_bloc_final/screens/countryDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CountryBloc countryBloc = CountryBloc();

  @override
  void initState() {
    countryBloc.add(GetCountryData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST COUNTRIES"),
      ),
      body: BlocProvider(
        create: (context) => CountryBloc(),
        child: BlocBuilder<CountryBloc, CountryState>(
          bloc: countryBloc,
          builder: (context, state) {
            if (state.getCountryDataStatus == GetCountryDataStatus.initial ||
                state.getCountryDataStatus == GetCountryDataStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.getCountryDataStatus ==
                GetCountryDataStatus.success) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryDetails(
                            countryData: state.getCountryDataList[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(state.getCountryDataList[index]
                                ["flags"]["png"]),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${state.getCountryDataList[index]["name"]["common"]}",
                                ),
                                Text(
                                  state.getCountryDataList[index]
                                          .containsKey("capital")
                                      ? "Capital: ${state.getCountryDataList[index]["capital"][0]}"
                                      : "Capital: no data found",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.getCountryDataList.length,
              );
            } else if (state.getCountryDataStatus ==
                GetCountryDataStatus.failure) {
              return const Center(
                child: Text("Something went wrong"),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
