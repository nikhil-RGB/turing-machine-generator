import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:turing_machines/models/TuringMachines.dart';
import 'package:turing_machines/screens/TapeScreen.dart';
import 'package:turing_machines/widgets/EntryForm.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key, required this.machine});
  final TuringMachine machine;
  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final TextEditingController _entryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TableScreen"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.machine.reset();
                  });
                },
                icon: const Icon(Icons.restart_alt_rounded))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataTable(
                decoration: const BoxDecoration(
                  color: Colors.blue, // Set the background color here
                ),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'M-config',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Symbol',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Actions',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'New m-config',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('B')),
                      DataCell(Text('NONE')),
                      DataCell(Text('P0,R')),
                      DataCell(Text('Q')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Q')),
                      DataCell(Text('NONE')),
                      DataCell(Text('L')),
                      DataCell(Text('Q')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Q')),
                      DataCell(Text('0')),
                      DataCell(Text('R,P0')),
                      DataCell(Text('Q')),
                    ],
                  ),
                ],
              ),
              const Gap(80),
              const EntryForm(),
              const Gap(22),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Add Row to table."),
              ),
              const Gap(80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TapeScreen(machine: widget.machine);
                  }));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Create Machine",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _inputEntryForm() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.baseline,
  //       textBaseline: TextBaseline.alphabetic,
  //       children: [
  //         const Text("Input Table Entry"),
  //         const Gap(10),
  //         SizedBox(
  //           height: 150,
  //           width: 250,
  //           child: TextField(
  //             controller: _entryController,
  //             decoration: const InputDecoration(
  //               fillColor: Colors.blue,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
