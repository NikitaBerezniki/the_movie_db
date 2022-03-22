import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_movie_db/resources/styles.dart';
import 'calculator_model.dart';
import 'calculator_provider.dart';



class SimpleCalculatorWidget extends StatelessWidget {
  const SimpleCalculatorWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CalculatorMockup()),
    );
  }
}

class CalculatorMockup extends StatefulWidget {
  const CalculatorMockup({Key? key}) : super(key: key);

  @override
  State<CalculatorMockup> createState() => _CalculatorMockupState();
}

class _CalculatorMockupState extends State<CalculatorMockup> {
  final _model = CalculatorModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: CalculatorProvider(
          model: _model,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                FirstArgument(),
                SizedBox(height: 20),
                SecondArgument(),
                SizedBox(height: 20),
                // ArithmeticOperationsButton(),
                // SizedBox(height: 20),
                TextResult()
              ]),
        ),
      ),
    );
  }
}




class FirstArgument extends StatelessWidget {
  const FirstArgument({Key? key}) : super(key: key);
  void _onChanged(BuildContext context, String value) {
    CalculatorProvider.of(context)?.firstNumber = value;
    CalculatorProvider.of(context)?.sum();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      decoration: AppTextFieldStyle.inputDecorationTextField,
      // onChanged: (value) => CalculatorProvider.of(context)?.firstNumber = value,
      onChanged: (value) => _onChanged(context, value),
    );
  }
}

class SecondArgument extends StatelessWidget {
  const SecondArgument({Key? key}) : super(key: key);
  void _onChanged(BuildContext context, String value) {
    CalculatorProvider.of(context)?.secondNumber = value;
    CalculatorProvider.of(context)?.sum();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        decoration: AppTextFieldStyle.inputDecorationTextField,
        onChanged: (value) => _onChanged(context, value));
    // onChanged: (value) =>CalculatorProvider.of(context)?.secondNumber = value);
  }
}

class TextResult extends StatelessWidget {
  const TextResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = CalculatorProvider.of(context)?.result ?? '0';
    return Text(
      'Результат: $value',
      style: AppTextStyle.textBlack22,
    );
  }
}



class ArithmeticOperationsButton extends StatelessWidget {
  const ArithmeticOperationsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => CalculatorProvider.of(context)?.sum(),
      child: Text('Подсчитать сумму'),
    );
  }
}




/*class TextResult extends StatefulWidget {
  const TextResult({Key? key}) : super(key: key);

  @override
  State<TextResult> createState() => _TextResultState();
}

class _TextResultState extends State<TextResult> {
  String? _value = '0';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = CalculatorProvider.of(context)?.model;
    model?.addListener(() {
      _value = '${model.result}';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final value = CalculatorProvider.of(context)?.model.resultNumber ?? 0;
    return Text('Результат: $_value', style: AppTextStyle.textBlack22);
  }
}
*/