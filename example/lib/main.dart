import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Input Chips Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> values = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Input Chips Demo")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// flutter input chips widget
              FlutterInputChips(
                initialValue: const [],
                maxChips: 5,
                onChanged: (v) {
                  setState(() {
                    values = v;
                  });
                },
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter text here",
                ),
                chipTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                chipSpacing: 8,
                chipDeleteIconColor: Colors.white,
                chipBackgroundColor: Colors.blueGrey,
                onMaxChipsReached: () {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text("Max chips reached!"),
                      ),
                    );
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 8),
                child: const Text(
                  "Chip Values:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(values.join(', ')),
            ],
          ),
        ),
      ),
    );
  }
}
