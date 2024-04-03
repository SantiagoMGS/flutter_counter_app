import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void incrementCounter() {
    counter++;
    setState(() {});
  }

  void decrementCounter() {
    counter--;
    setState(() {});
  }

  void resetCounter() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize20 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clicks counter:',
              style: fontSize20,
            ),
            const SizedBox(height: 20),
            Text('$counter', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
          incrementFn: incrementCounter,
          decrementFn: decrementCounter,
          resetFn: resetCounter),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function incrementFn;
  final Function decrementFn;
  final Function resetFn;

  const CustomFloatingActions({
    super.key,
    required this.incrementFn,
    required this.decrementFn,
    required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => decrementFn(),
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.refresh),
        ),
        FloatingActionButton(
          onPressed: () => incrementFn(),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
