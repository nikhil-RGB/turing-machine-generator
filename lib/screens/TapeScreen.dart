import 'package:flutter/material.dart';
import 'package:turing_machines/exceptions/action_exceptions.dart';
import 'package:turing_machines/models/TuringMachines.dart';
import 'package:turing_machines/widgets/TapeWidget.dart';
import 'package:gap/gap.dart';

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
      appBar: AppBar(title: const Text("Tape Screen"), actions: <Widget>[
        IconButton(
            onPressed: () {
              setState(() {
                widget.machine
                    .softReset(); //hard-reset on tape,soft-reset on machine state.
              });
            },
            icon: const Icon(
              Icons.restart_alt_rounded,
              color: Colors.blue,
            )),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Padding on the left and right of the tape widget prevents the tape from touching the ends of the window
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TapeWidget(
              tape: widget.machine.tape,
            ),
          ),
          const Gap(20),
          Text(
            "Current pointer: ${widget.machine.tape.pointer}",
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const Gap(2),
          Text(
            "Current m-config: ${widget.machine.current_config}",
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const Gap(2),
          Text(
            "Scanned Symbol: ${scannedSymbol(widget.machine.tape.tape[widget.machine.tape.pointer])}",
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const Gap(2),
          Text(
            "Iteration number: ${widget.machine.iterations}",
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const Gap(5),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool result = true;
          try {
            widget.machine.stepIntoConfig();
          } on InvalidLookupException {
            result = false;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Turing Machine has Halted!'),
                backgroundColor: Colors.red,
              ),
            );
          } on TapeOperationException catch (e) {
            result = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (result) {
            setState(() {});
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    ));
  }

  static String scannedSymbol(String symbol) {
    if (symbol == "") {
      return "NONE";
    }
    return symbol;
  }
}
