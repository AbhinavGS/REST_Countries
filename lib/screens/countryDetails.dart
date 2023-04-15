import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  var countryData;
  CountryDetails({
    super.key,
    required this.countryData,
  });

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (() {
              Navigator.pop(context);
            })),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight * 0.33,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.countryData["flags"]["png"]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Official Name: ${widget.countryData["name"]["official"]}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Region: ${widget.countryData["region"]}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sub Region: ${widget.countryData["subregion"]}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Currency: ${widget.countryData["currencies"].keys.toList().first.toString()}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Area: ${widget.countryData["area"].toString()} sq.km",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Population: ${widget.countryData["population"].toString()}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Coat of Arms:",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: deviceHeight * 0.1,
                      height: deviceHeight * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.countryData["coatOfArms"]["png"],
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
