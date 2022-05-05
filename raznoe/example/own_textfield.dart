import 'package:flutter/material.dart';

class OwnTextField extends StatefulWidget {
  OwnTextField({Key? key}) : super(key: key);

  @override
  State<OwnTextField> createState() => _OwnTextFieldState();
}

class _OwnTextFieldState extends State<OwnTextField> {
  String textName = 'Nikita';
  String textSurname = 'Solonitsyn';
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingValue textEditingValue = TextEditingValue();
  FocusNode oneFocusNode = FocusNode();
  FocusNode twoFocusNode = FocusNode();

  InputDecoration _inputDecor(String label) {
    return InputDecoration(
      labelText: label,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.4))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue)),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController.text = textName;
    surnameController.text = textSurname;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void onChangedName(String str) {
    setState(() {
      textName = str;
    });
  }

  void onChangedSurname(String str) {
    setState(() {
      textSurname = str;
    });
  }

  void onEditingComplete() {
    // oneFocusNode.nextFocus();
  }

  void onTap() {
    // nameController.addListener(() {});
    // oneFocusNode.nextFocus();
  }

  void onButton() {
    // oneFocusNode.requestFocus();
    oneFocusNode.nextFocus();
    // print(oneFocusNode.hasFocus);
    // print(twoFocusNode.hasFocus);
    oneFocusNode.addListener(() {
      print(oneFocusNode.hasFocus);
    });
    oneFocusNode.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: onButton,
                child: Text(
                  'Press',
                  style: TextStyle(fontSize: 24),
                )),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            TextField(
              // autofocus: true,
              focusNode: oneFocusNode,
              // textInputAction: TextInputAction.next,
              controller: nameController,
              decoration: _inputDecor('Name'),
              onChanged: onChangedName,
              onEditingComplete: onEditingComplete,
              onTap: onTap,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            TextField(
              focusNode: twoFocusNode,
              controller: surnameController,
              decoration: _inputDecor('Surname'),
              onChanged: onChangedSurname,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.person)),
                  WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                      text: '$textName $textSurname',
                      style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          ],
        ),
      )),
    );
  }
}
