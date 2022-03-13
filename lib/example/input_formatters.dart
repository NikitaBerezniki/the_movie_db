import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';

// ignore: must_be_immutable
class InputFormatters extends StatefulWidget {
  InputFormatters({Key? key}) : super(key: key);

  @override
  State<InputFormatters> createState() => _InputFormattersState();
}

class _InputFormattersState extends State<InputFormatters> {
  TextEditingController phoneController = TextEditingController();
  String phoneText = '';

  void onChangedText(String str) {
    setState(() {
      phoneText = str;
    });
  }

  // PhoneInputFormatter.replacePhoneMask(countryCode: 'RU',newMask: '+0 (000) 000 00 00');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              onChanged: onChangedText,
              // maxLength: 15,
              inputFormatters: [
                PhoneInputFormatter()
                // FilteringTextInputFormatter.allow(RegExp(r'\d+'))
              ],
              controller: phoneController,
              style: TextStyle(letterSpacing: 2.5),
              toolbarOptions: ToolbarOptions(paste: true),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              keyboardAppearance: Brightness.dark,
              decoration: InputDecoration(
                counterText: '',
                // prefixText: '',
                labelText: 'Телефон',
                prefixIcon: Icon(Icons.phone),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelStyle: TextStyle(fontSize: 18),
                border: UnderlineInputBorder(
                  // borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(
            phoneText,
            style: TextStyle(fontSize: 24),
          )
        ]),
      ),
    );
  }
}

class PPhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');

    var newString = <String>[];

    final initialSpeshialSimbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;

    var cursorPosition = newValue.selection.start - initialSpeshialSimbolCount;
    final digitsOnlyChar = digitsOnly.split('');

    var finalCursorPosition = cursorPosition;

    for (var i = 0; i < digitsOnlyChar.length; i++) {
      if (i == 0) {
        newString.add('(');
        if (i <= finalCursorPosition) finalCursorPosition++;
      } else if (i == 3) {
        newString.add(') ');
        if (i <= finalCursorPosition) finalCursorPosition += 2;
      } else if (i == 6 || i == 8) {
        newString.add('-');
        if (i <= finalCursorPosition) finalCursorPosition++;
      }
      newString.add(digitsOnly[i]);
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      // selection: newValue.selection,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}
