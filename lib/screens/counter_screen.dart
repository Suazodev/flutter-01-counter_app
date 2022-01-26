import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize30 =
        const TextStyle(fontFamily: 'Montserrat', fontSize: 30.0);
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Clicks Counter: $counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFunction: increaseCounter,
        decreaseFunction: decreaseCounter,
        resetFunction: resetCounter,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFunction;
  final Function decreaseFunction;
  final Function resetFunction;
  const CustomFloatingActions({
    Key? key,
    required this.increaseFunction,
    required this.decreaseFunction,
    required this.resetFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFunction(),
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () => increaseFunction(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => resetFunction(),
          child: const Icon(Icons.restore),
        ),
      ],
    );
  }
}
