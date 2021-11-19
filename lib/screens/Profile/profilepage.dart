import 'package:cathay_pass_app/components/bottomnavbar.dart';
import 'package:cathay_pass_app/components/customappbar.dart';
import 'package:cathay_pass_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      leading: SizedBox(),
      // On Android it's false by default
      centerTitle: true,
      title: Text(""),
      actions: <Widget>[
        TextButton(onPressed: () {}, child: Icon(Icons.edit)),
      ],
    );
  }
}
