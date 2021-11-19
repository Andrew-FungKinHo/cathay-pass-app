import 'package:cathay_pass_app/constants/constants.dart';
import 'package:cathay_pass_app/widgets/placeRisk.dart';
import 'package:cathay_pass_app/widgets/riskPointer.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'dart:convert';

// var cbsa = 36260; // add this line

class TaskTimeline extends StatelessWidget {
  final Map<String, dynamic> detail;
  TaskTimeline(this.detail);

  // start code here

  final url_des1 =
      "https://api.covidactnow.org/v2/cbsa/36260.json?apiKey=69ed0fe788624a5c95e562a12315a20b";
  // link 2: risk 5
  final url_des2 =
      "https://api.covidactnow.org/v2/county/23007.json?apiKey=69ed0fe788624a5c95e562a12315a20b";

  Future<placeRisk> getJsonData(String callURL, String title) async {
    // ADD: use which link depends on which title( the place)
    if (title == 'Namdaemun Night Market') {
      callURL = url_des1;
    } else if (title == 'Yeouido World Night Market') {
      callURL = url_des2;
    }

    var response = await http.get(Uri.parse(callURL)); // Uri.encodeFull(url)
    if (response.statusCode == 200) {
      final convertDataJSON = jsonDecode(response.body);
      return placeRisk.fromJson(convertDataJSON);
    } else {
      throw Exception("try to reload");
    }
  }

  @override
  Widget build(BuildContext context) {
    // this.getJsonData();
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeline(detail['tlColor']),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detail['time']),
                detail['title'].isNotEmpty
                    ? _buildCard(
                        detail['bgColor'],
                        detail['title'],
                        detail['slot'],
                        detail['isHighRisk'],
                      )
                    : _buildCard(Colors.white, '', '', false)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(Color bgColor, String title, String slot, bool isHighRisk) {
    String passURL = url_des1; // default use lin 1
    this.getJsonData(passURL, title);

    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: bgColor == AppColors.fadewhite.withOpacity(0.25)
                  ? AppColors.green
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          isHighRisk == false
              ? Text(
                  slot,
                  style: TextStyle(
                    color: bgColor == AppColors.fadewhite.withOpacity(0.25)
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      slot,
                      style: TextStyle(
                        color: bgColor == AppColors.fadewhite.withOpacity(0.25)
                            ? Colors.black.withOpacity(0.6)
                            : Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                    ),
                    FutureBuilder(
                      future:
                          // default send url_des1
                          // pass the title as well
                          getJsonData(url_des1, title),
                      builder: (BuildContext context, SnapShot) {
                        // SnapShot can be changed
                        if (SnapShot.hasData) {
                          final covid = SnapShot.data;
                          return (Row(
                            children: <Widget>[
                              Container(
                                constraints:
                                    BoxConstraints(maxHeight: 35, maxWidth: 35),
                                child: riskLevelPointer(
                                  covid.riskLevel.toString(),
                                ),
                              ),
                            ],
                          ));
                        } else if (SnapShot.hasError) {
                          return Text(SnapShot.error.toString());
                        } else
                          return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildTimeline(Color color) {
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: color),
            ),
          ),
        ),
        afterLineStyle: LineStyle(
          thickness: 2,
          color: color,
        ),
      ),
    );
  }
}
