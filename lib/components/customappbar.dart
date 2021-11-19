import 'package:cathay_pass_app/constants/constants.dart';
import 'package:cathay_pass_app/widgets/notification.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  CustomAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    if (title == null) title = '';
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      elevation: 0.0,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Stack(
            children: [
              Icon(Icons.notifications),
              Positioned(
                child: Icon(
                  Icons.circle,
                  size: 8,
                  color: Color(0xFFFD2F22),
                ),
                top: 0,
                right: 0,
              )
            ],
          ),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => NotificationsPopUp());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
