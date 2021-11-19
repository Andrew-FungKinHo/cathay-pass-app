import 'dart:convert';
import 'package:http/http.dart' as http;

class placeRisk {
  final int riskLevel;
  var dailyNewCases;
  var infectionRate;
  var positiveTestRate;
  var percentVaccinated;
  var country;

  placeRisk(
      {this.riskLevel,
      this.dailyNewCases,
      this.infectionRate,
      this.positiveTestRate,
      this.percentVaccinated,
      this.country});

  factory placeRisk.fromJson(final json) {
    return placeRisk(
      riskLevel: json["riskLevels"]["overall"],
      dailyNewCases: json["newCases"],
      infectionRate: json["metrics"]["infectionRate"],
      positiveTestRate: json["metrics"]["testPositivityRatio"],
      percentVaccinated: json["metrics"]["vaccinationsInitiatedRatio"],
      country: json["country"],
    );
  }

  /*
  Future<void> getData() async {
    Response res = await get();
    jsonDecode((res.body));

    riskLevel;
    dailyNewCases;
    infectionRate;
    positiveTestRate;
    percentVaccinated;
  }
  */
}
