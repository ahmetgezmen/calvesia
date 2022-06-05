import 'package:flutter/material.dart';


class CalenderWidget extends StatefulWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {

  void setQueryForDay(String string) {

  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("coming soon"),);
    // Column(
    //   children: [
    //     CalendarDatePicker(
    //         initialDate: DateTime.now(),
    //         firstDate: DateTime(DateTime.now().year - 1),
    //         lastDate: DateTime(DateTime.now().year + 1),
    //         onDateChanged: (day) {
    //           setState((){
    //             setQueryForDay(day.toString());
    //           });
    //         }),
    //   ],
    // );
  }
}


