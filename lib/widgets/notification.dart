import 'package:cathay_pass_app/constants/sizeconfig.dart';
import 'package:cathay_pass_app/screens/Reselect/reselectpage.dart';
import 'package:flutter/material.dart';

class NotificationsPopUp extends StatelessWidget {
  const NotificationsPopUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        // height: SizeConfig.screenHeight * 0.85,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              //width: SizeConfig.screenWidth*0.8-32,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.notification_important,
                    color: Color(0xFFFAD605),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                      child: Text(
                    'Reminder: Get your COVID-19 test result within 48 hours',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ReselectPage(),
                //   ),
                // );
              },
              child: Container(
                //width: SizeConfig.screenWidth*0.8-32,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.warning_rounded,
                      color: Color(0xFFFD2F22),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                        child: Text(
                      'Your travel plan has been rescheduled due to a flight delay. Please confirm changes.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 64,
              ),
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text('Clear'),
            // )
          ],
        ),
      ),
    );
  }
}
