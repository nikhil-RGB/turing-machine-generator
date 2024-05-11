import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:turing_machines/models/TuringMachineModel.dart';
import 'package:turing_machines/screens/TableScreen.dart';

class LoadMachineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Box machineBox = Hive.box<TuringMachineModel>("turing_machines");
    List<dynamic> names = machineBox.keys.toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Load a saved machine"),
        ),
        body: Center(
          child: (names.isEmpty)
              ? const Text("No machines to view!")
              : ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.blue,
                      title: Center(
                          child: Text(
                        names[index] as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TableScreen(
                              machine: machineBox
                                  .get(names[index] as String)
                                  .actuateMachine());
                        }));
                      },
                    );
                  }),
        ),
      ),
    );
  }
}
