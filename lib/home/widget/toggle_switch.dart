import 'package:flutter/material.dart';
import 'package:whether_app/db/funtions/db_functions.dart';

class SwitchScreen extends StatefulWidget {
  SwitchScreen({super.key, required this.id, required this.status});

  late bool status;
  int? id;
  @override
  State<SwitchScreen> createState() => new _SwitchClass();
}

class _SwitchClass extends State<SwitchScreen> {
  void toggleSwitch(bool value) {
    if (value == false) {
      setState(() {
        widget.status = false;
        updateItem(widget.id, value);
      });
      print('Switch Button is OFF');
    } else {
      setState(() {
        widget.status = true;
        updateItem(widget.id, value);
      });
      print('Switch Button is ON');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1,
          child: Switch(
            onChanged: toggleSwitch,
            value: widget.status,
            activeColor: Color(0xFF556bf9),
            activeTrackColor: Color.fromARGB(255, 116, 132, 235),
            inactiveThumbColor: Colors.blueGrey,
            inactiveTrackColor: Colors.blueGrey.shade200,
          )),
    ]);
  }
}
