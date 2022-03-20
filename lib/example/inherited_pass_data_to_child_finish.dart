import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/styles.dart';
// практика остановился на 17.21
//теория остановился на 48.37
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DataOwnerWidget()),
    );
  }
}

class DataOwnerWidget extends StatefulWidget {
  const DataOwnerWidget({Key? key}) : super(key: key);

  @override
  State<DataOwnerWidget> createState() => _DataOwnerWidgetState();
}

class _DataOwnerWidgetState extends State<DataOwnerWidget> {
  int _value = 0;

  void _increment() {
    setState(() {
      _value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _increment,
            child: const Text(
              'Жми',
              style: AppTextStyle.textBlack22,
            ),
          ),
          const DataConsumerStateless()
        ],
      ),
    );
  }
}

class DataProviderInherited extends InheritedWidget {
  final int value;

  const DataProviderInherited(Key? key, this.value, {required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value =
        context.findAncestorStateOfType<_DataOwnerWidgetState>()?._value ?? 0;
    return Column(children: [
      Text(
        '$value',
        style: AppTextStyle.textBlack22,
      ),
      const DataConsumerStatefull()
    ]);
  }
}

class DataConsumerStatefull extends StatefulWidget {
  const DataConsumerStatefull({Key? key}) : super(key: key);

  @override
  State<DataConsumerStatefull> createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {
    final value =
        context.findAncestorStateOfType<_DataOwnerWidgetState>()?._value ?? 0;
    return Text(
      '$value',
      style: AppTextStyle.textBlack22,
    );
  }
}
