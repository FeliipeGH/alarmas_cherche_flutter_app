import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ClockInput extends StatefulWidget {
  final Function(TimeOfDay date) thenDateFunction;
  final Function(String value) onChange;
  final String helpText;
  final String helperText;
  final String labelText;
  final String hintText;
  final String errorText;
  final String dataString;
  final String initialDate;
  final DateTime lastDate;

  const ClockInput(
      {Key key,
      this.thenDateFunction,
      this.onChange,
      this.helpText,
      this.helperText,
      this.labelText,
      this.hintText,
      this.errorText,
      this.dataString,
      this.initialDate,
      this.lastDate})
      : super(key: key);

  @override
  _ClockInputState createState() => _ClockInputState();
}

class _ClockInputState extends State<ClockInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return dateInput();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.text =
        widget.dataString != null ? widget.dataString : "";
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController?.dispose();
  }

  Future<Null> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });
    widget.thenDateFunction(time);
    //final DateFormat formatter = DateFormat('yyyy-MM-dd');
    _textEditingController.text=time.format(context);
  }

  Widget dateInput() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        _selectTime();
      },
      child: Container(
        color: Colors.transparent,
        child: TextField(
          focusNode: FocusNode(),
          enableInteractiveSelection: false,
          enabled: false,
          controller: _textEditingController,
          decoration: InputDecoration(
              fillColor: Theme.of(context).dividerColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  )),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffECEEF2),
                  width: 1.05,
                ),
              ),
              contentPadding: EdgeInsets.all(8),
              //here your padding
              hintText: widget.hintText,
              labelText: widget.labelText,
              helperText: widget.helperText,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              prefixIcon: Icon(
                Icons.alarm,
                color: Colors.black,
              ),
              errorText: widget.errorText),
          onChanged: widget.onChange,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) =>
              FocusScope.of(context).unfocus(), // move focus to next
        ),
      ),
    );
  }
}
