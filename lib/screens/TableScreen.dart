import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:turing_machines/models/TuringMachines.dart';
import 'package:turing_machines/screens/TapeScreen.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key, required this.machine});
  final TuringMachine machine;
  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TableScreen"),
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
              const Gap(20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TapeScreen(machine: widget.machine);
                    }));
                  },
                  child: const Text("Start/Resume Machine"))
            ],
          ),
        ),
      ),
    );
  }
}
