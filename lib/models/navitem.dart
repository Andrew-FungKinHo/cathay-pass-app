import 'package:cathay_pass_app/constants/constants.dart';
import 'package:cathay_pass_app/models/task.dart';
import 'package:cathay_pass_app/screens/Menu/menupage.dart';
import 'package:cathay_pass_app/screens/Profile/profilepage.dart';
import 'package:cathay_pass_app/screens/Reselect/reselectpage.dart';
import 'package:cathay_pass_app/screens/TripPlanner/calendarpage.dart';
import 'package:flutter/material.dart';

class NavItem {
  final int id;
  final Icon icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void chnageNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: Icon(Icons.home),
      destination: MenuScreen(),
    ),
    NavItem(
      id: 2,
      icon: Icon(Icons.calendar_today),
      //destination: HomeScreen(),
      destination: CalendarPage(
        Task(
          iconData: Icon(Icons.travel_explore),
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
        ),
      ),
    ),
    NavItem(
      id: 3,
      icon: Icon(Icons.account_circle),
      destination: ProfileScreen(),
    ),
  ];
}
