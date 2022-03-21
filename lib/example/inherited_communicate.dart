import 'package:flutter/material.dart';

class ExampleInheritedCommunicate extends StatelessWidget {
  const ExampleInheritedCommunicate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SimpleCalcWidget()),
    );
  }
}

class SimpleCalcWidget extends StatelessWidget {
  const SimpleCalcWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const FirstNumberWidget(),
            SizedBox(
              height: 20,
            ),
            const SecondNumberWidget(),
            SizedBox(
              height: 20,
            ),
            const SummButtonWidget(),
          ]),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(in);
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Подсчитать сумму'),
    );
  }
}
