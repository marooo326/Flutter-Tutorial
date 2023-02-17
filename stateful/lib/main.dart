import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];
  bool showTtile = true;

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      showTtile = !showTtile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.amber.shade100,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTtile ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.change_circle_outlined))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });
  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  //widget life cycle
  @override
  void initState() {
    super.initState();
    print('[initState] Called before "build", use for api or initialization.');
  }

  @override
  void dispose() {
    super.dispose();
    print('[dipose] Called when widget is removed.');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Ttile',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
