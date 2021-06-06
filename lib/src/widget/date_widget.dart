import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  final Function(DateTime date) thenDateFunction;
  final Function(String value) onChange;
  final String helpText;
  final String helperText;
  final String labelText;
  final String hintText;
  final String errorText;
  final String dataString;
  final String initialDate;
  final DateTime lastDate;

  const DateInput(
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
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
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

  Widget dateInput() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();

        showDatePicker(
          locale: const Locale('es', 'MX'),
          helpText: widget.helperText,
          context: context,
          initialDate: widget.initialDate != null
              ? DateTime.parse(widget.initialDate)
              : DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 360 * 100)),
          lastDate: widget.lastDate ?? DateTime.now(),
        ).then((DateTime date) {
          if (date != null) {

            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            _textEditingController.text=formatter.format(date);
            widget.thenDateFunction(date);
          }
        });
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
                Icons.date_range,
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
