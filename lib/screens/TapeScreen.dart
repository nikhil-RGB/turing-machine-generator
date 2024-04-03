import 'package:flutter/material.dart';
import 'package:turing_machines/models/TuringMachines.dart';
import 'package:turing_machines/widgets/TapeWidget.dart';

class TapeScreen extends StatefulWidget {
  final TuringMachine machine;
  const TapeScreen({super.key, required this.machine});

  @override
  State<TapeScreen> createState() => _TapeScreenState();
}

class _TapeScreenState extends State<TapeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Tape Screen"),
      ),
      body: Center(
        child: TapeWidget(
          tape: widget.machine.tape,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.machine.stepIntoConfig();
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    ));
  }
}
