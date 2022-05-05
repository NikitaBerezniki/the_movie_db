import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/styles.dart';

// практика остановился на 
//теория остановился на 
class ExampleInherited extends StatelessWidget {
  const ExampleInherited({Key? key}) : super(key: key);

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
  int _valueOne = 0;
  int _valueTwo = 0;
  void _incrementOne() {
    setState(() {
      _valueOne++;
    });
  }
  void _incrementTwo() {
    setState(() {
      _valueTwo++;
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
            onPressed: _incrementOne,
            child: const Text(
              'Жми one',
              style: AppTextStyle.textBlack22,
            ),
          ),
          ElevatedButton(
            onPressed: _incrementTwo,
            child: const Text(
              'Жми two',
              style: AppTextStyle.textBlack22,
            ),
          ),
          DataProviderInheritedModel(
            valueOne: _valueOne,
            valueTwo: _valueTwo,
            child: const DataConsumerStateless(),
          )
        ],
      ),
    );
  }
}

class DataProviderInheritedModel extends InheritedModel<String> {
  final int valueOne;
  final int valueTwo;

  DataProviderInheritedModel({
    Key? key,
    required this.valueOne,
    required this.valueTwo,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotifyDependent(
    covariant DataProviderInheritedModel oldWidget,
    Set<String> aspects,
  ) {
    final isValueOneUpdated =
        oldWidget.valueOne != valueOne && aspects.contains('one');
    final isValueTwoUpdated =
        oldWidget.valueTwo != valueTwo && aspects.contains('two');
    print('$isValueOneUpdated $isValueTwoUpdated');
    return isValueOneUpdated || isValueTwoUpdated;
  }

  @override
  bool updateShouldNotify(DataProviderInheritedModel oldWidget) {
    return oldWidget.valueOne != valueOne || oldWidget.valueTwo != valueTwo;
  }
}

class DataProviderInheritedWidget extends InheritedWidget {
  final int value;
  DataProviderInheritedWidget({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataProviderInheritedWidget oldWidget) {
    return oldWidget.value != value;
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInheritedModel>(
                aspect: 'one')
            ?.valueOne ??
        0;

    // final element = context
    //     .getElementForInheritedWidgetOfExactType<DataProviderInheritedWidget>();
    // if (element != null) {
    //   context.dependOnInheritedElement(element);
    // }
    // final dataProvider = element?.widget as DataProviderInheritedWidget;
    // final value = dataProvider.value;

    // final value = getInherit<DataProviderInherited>(context)?.value ?? 0;
    return Column(children: [
      Text(
        '$value',
        style: AppTextStyle.textBlack22,
      ),
      const DataConsumerStatefull()
    ]);
  }
}

T? getInherit<T>(BuildContext context) {
  final element = context
      .getElementForInheritedWidgetOfExactType<DataProviderInheritedWidget>();
  final widget = element?.widget;
  if (widget is T) {
    return widget as T;
  } else {
    return null;
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
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInheritedModel>(
                aspect: 'two')
            ?.valueTwo ??
        0;
    // context.findAncestorStateOfType<_DataOwnerWidgetState>()?._value ?? 0;
    return Text(
      '$value',
      style: AppTextStyle.textBlack22,
    );
  }
}
