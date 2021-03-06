import 'package:cathay_pass_app/components/bottomnavbar.dart';
import 'package:cathay_pass_app/constants/constants.dart';
import 'package:cathay_pass_app/models/task.dart';
import 'package:cathay_pass_app/screens/Reselect/reselectpage.dart';
import 'package:flutter/material.dart';
import 'components/datepicker.dart';
import 'components/tasktimeline.dart';

class CalendarPage extends StatelessWidget {
  final Task task;
  CalendarPage(this.task);
  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePicker(),
                  ],
                ),
              ),
            ),
            detailList == null
                ? SliverFillRemaining(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'No task today',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) => TaskTimeline(detailList[index]),
                      childCount: detailList.length,
                    ),
                  ),
          ],
        ),
        // bottomNavigationBar: MyBottomNavBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _notification(context);
            showGeneralDialog(
                context: context,
                transitionBuilder: (context, a1, a2, widget) {
                  final curvedValue =
                      Curves.easeInOutBack.transform(a1.value) - 1.0;
                  return Transform(
                    transform:
                        Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                    child: _notification(context),
                  );
                },
                transitionDuration: Duration(milliseconds: 200),
                barrierDismissible: true,
                barrierLabel: '',
                pageBuilder: (context, animation1, animation2) {});
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat);
  }

  Widget _notification(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          minimum: EdgeInsets.only(top: 75.0),
          child: Dialog(
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ReselectPage(),
                //   ),
                // );
              },
              child: Container(
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
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 16,
          ),
        )
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 64,
      backgroundColor: AppColors.green,
      actions: [
        Icon(
          Icons.notifications,
        ),
        SizedBox(
          width: 8,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Text(
                'Trip Planner',
                style: TextStyle(
                  fontFamily: 'Pangram',
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
