import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

/// This is the private State class that goes with CheckBox.
class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      value: this.isChecked,
      onChanged: (bool value) {
        setState(() {
          this.isChecked = value;
        });
      },
    );
  }
}
