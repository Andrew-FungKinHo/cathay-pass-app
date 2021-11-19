import 'package:cathay_pass_app/models/navitem.dart';
import 'package:cathay_pass_app/screens/Subscription/subscriptionpage.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'package:provider/provider.dart';
import 'models/task.dart';
import 'screens/Booking/components/selectionprovider.dart';
import 'screens/TripPlanner/calendarpage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NavItems(),
      ),
      ChangeNotifierProvider(create: (context) => SelectionProvider())
    ],
    child: CathayPassApp(),
  ));
}

class CathayPassApp extends StatelessWidget {
  // This widget is the root of your application.
  final Task task = Task(
    iconData: Icon(Icons.person_rounded),
    title: 'Personal',
    bgColor: Colors.purple,
    iconColor: Colors.orange,
    btnColor: Colors.yellow,
    left: 3,
    done: 1,
    desc: [
      {
        'time': '6:00 pm',
        'title': 'Flight CX418 Arrive at ICN Airport',
        'slot': '6:05 - 7:00 pm',
        'tlColor': AppColors.green,
        'bgColor': AppColors.green.withOpacity(0.6),
        'isHighRisk': false,
      },
      {
        'time': '7:00 pm',
        'title': 'Dinner',
        'slot': '7:00 - 8:00 pm',
        'tlColor': AppColors.fadewhite,
        'bgColor': AppColors.fadewhite.withOpacity(0.25),
        'isHighRisk': false,
      },
      {
        'time': '8:00 pm',
        'title': 'Travel to Hotel Cappuccino',
        'slot': '8:00 - 9:00 pm',
        'tlColor': AppColors.green,
        'bgColor': AppColors.green.withOpacity(0.6),
        'isHighRisk': false,
      },
      {
        'time': '9:00 pm',
        'title': '',
        'slot': '',
        'tlColor': AppColors.fadewhite,
        'isHighRisk': false,
      },
      {
        'time': '10:00 pm',
        'title': 'Namdaemun Night Market',
        'slot': '10:00 - 11:00 pm',
        'tlColor': AppColors.fadewhite,
        'bgColor': AppColors.fadewhite.withOpacity(0.25),
        'isHighRisk': true,
      },
      {
        'time': '11:00 pm',
        'title': 'Yeouido World Night Market',
        'slot': '11:00 - 12:00 am',
        'tlColor': AppColors.green,
        'bgColor': AppColors.green.withOpacity(0.6),
        'isHighRisk': true,
      },
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cathay Pass',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: AppColors.primarySwatch,
        fontFamily: 'OpenSans',
        // We apply this to our appBarTheme because most of our appBar have this style
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: AppColors.kPrimaryColor,
            elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MenuScreen(),
      // home: SubscriptionPage(),
      home: SubscriptionPage(),
    );
  }
}
